"""
An Extension is comprised of Component objects, the objects are used for tokenizeing markdown
and converting tokens to rendered HTML.
"""
from MooseDocs.common import exceptions, parse_settings, mixins, check_type
from MooseDocs.tree import tokens

class Extension(mixins.ConfigObject):
    """
    Base class for creating extensions. An extension is simply a mechanism to allow for
    the creation of reader/renderer components to be added to the translation process.

    All aspects of the MooseDocs system rely on Extension objects. These extensions are passed
    to the Translator object. The translator calls the extend method of the extension.

    Inputs:
        kwargs: All key-value pairs are treated as configure options, see ConfigObject.
    """
    @staticmethod
    def defaultConfig():
        """Basic Extension configuration options."""
        config = mixins.ConfigObject.defaultConfig()
        config['active'] = (True, "Toggle for disabling the extension. This only changes "
                                  "the initial active state, use setActive to control at runtime.")
        return config

    def __init__(self, **kwargs):
        mixins.ConfigObject.__init__(self, **kwargs)
        self.__requires = set()

        # The 'active' setting must be able to be set outside of the configure options to allow
        # for object constructors (i.e., appsyntax) to disable an extension internally. Because,
        # if only the config is used it is reset after building the page to the default to
        # support the config extension.
        self.__active = self.get('active')

    @property
    def active(self):
        """Return the 'active' status of the Extension."""
        return self.__active

    def setActive(self, value):
        """Set the active state for the extension."""
        self.__active = value

    def extend(self, reader, renderer):
        """
        Method for adding reader and renderering components.
        """
        pass

    def requires(self, *args):
        """
        Require that the supplied extension module exists within the Translator object. This
        method cannot be called before init().
        """
        self.__requires.update(args)

    def updateMetaData(self, meta, content, page):
        """
        Called after to reading the file.

        Input:
             meta[Meta]: Meta data object for storing data on the node (see translators.py)
             content[unicode]: A copy of the content read from the page.
        """
        pass

    def preExecute(self, root):
        """
        Called by Translator prior to beginning conversion, after reading.
        """
        pass

    def postExecute(self, root):
        """
        Called by Translator after all conversion is complete, prior to writing.
        """
        pass

    def preTokenize(self, ast, page):
        """
        Called by Translator prior to tokenization.

        Inputs:
            ast[tokens.Token]: The root node of the token tree.
        """
        pass

    def postTokenize(self, ast, page):
        """
        Called by Translator after tokenization.

        Inputs:
            ast[tokens.Token]: The root node of the token tree.
        """
        pass

    def preRender(self, result, page):
        """
        Called by Translator prior to rendereing.

        Inputs:
            result[tree.base.NodeBase]: The root node of the result tree.
        """
        pass

    def postRender(self, result, page):
        """
        Called by Translator after rendereing.

        Inputs:
            result[tree.base.NodeBase]: The root node of the result tree.
        """
        pass

class Component(object):
    """
    Each extension is made up of components, both for tokenizing and rendering. The components
    provide a means for defining settings as well as other customizable features required for
    translation.
    """
    def __init__(self):
        self.extension = None #TODO: wrap this with a property and setter (that does type checking)

class TokenComponent(Component, mixins.ReaderObject):
    """
    Base class for creating components designed to create a token during tokenization.

    # Overview
    TokenComponent objects are designed to be created by Extension objects and added to the Reader
    object in the Extension:extend method. The purpose of a TokenComponent is to define a regular
    expression, that when match returns a token that is added to the AST.

    The codebase of MooseDocs (Translator, Reader, Renderer) is certainly capable of tokenizing
    arbitrary formats. However, the primary use case is for creating HTML so there are a certain
    features for this class that are setup with that application in mind.

    ## RE Class Member
    The RE class member variable is used for convenience to
    allow for derived classes to avoid creating an __init__ method. As shown in core.py the purpose
    of this class is to be able to add parser syntax for tokenizing with a minimal amount code, the
    following static member variables aid in the design goal.

    RE must be defined as a compile re expressions that captures the content to be converted to a
    token within the createToken method.  - TOKEN: The token type (not instance) that will be
    created

    ## Settings
    If the supplied regex match option has a group named "settings" these settings will be
    automatically parsed by the translator and used to update the values returned by the
    defaultSettings method. These settings must be key-value pairings that use an equal sign that is
    does not contains spaces on either side (e.g., foo=bar).

    The automatic parsing settings may be disable by setting the PARSE_SETTINGS class member
    variable to False in the child object.
    """
    RE = None
    PARSE_SETTINGS = True

    @staticmethod
    def defaultSettings():
        """
        Default settings for the component. Child classes should define a similar method to create
        the default settings for the component, see core.py for examples.
        """
        settings = dict()
        settings['style'] = (u'', u"The style settings that are passed to rendered HTML tag.")
        settings['class'] = (u'', u"The class settings to be passed to rendered HTML tag.")
        settings['id'] = (u'', u"The class settings to be passed to the rendered tag.")
        return settings

    def __init__(self):
        """
        Constructs the object and sets the default settings of the object.
        """
        Component.__init__(self)
        mixins.ReaderObject.__init__(self)

        # Local settings, this is updated by __call__ just prior to calling the createToken()
        self.__settings = None

        # Check return type of default settings
        defaults = self.defaultSettings()
        if not isinstance(defaults, dict):
            msg = "The component '{}' must return a dict from the defaultSettings static method."
            raise exceptions.MooseDocsException(msg, self)

    def __call__(self, parent, info, page):
        """
        MooseDocs internal method, this should not be called, please use the createToken method.

        The lexer system within MooseDocs expects a function this method allows this class to act
        as a function.

        Inputs:
            info[LexerInformation]: Object containing the lexer information object.
            parent[tokens.Token]: The parent node in the AST for the token being created.
        """
        if not self.extension.active:
            tokens.DisabledToken(parent, string=info[0])
            return parent

        # Define the settings
        defaults = self.defaultSettings()
        if self.PARSE_SETTINGS and ('settings' in info):
            self.__settings, _ = parse_settings(defaults, info['settings'])
        else:
            self.__settings = {k:v[0] for k, v in defaults.iteritems()}

        # Call user method and reset settings
        token = self.createToken(parent, info, page)
        self.__settings = None
        return token

    @property
    def attributes(self):
        """
        Return a dictionary with the common html settings.

        This property is only available from within the createToken method, it returns None when
        called externally.
        """
        if self.__settings:
            return {'style':self.settings['style'].strip(),
                    'id':self.settings['id'].strip(),
                    'class':self.settings['class'].strip()}
        return dict()

    @property
    def settings(self):
        """
        Retrun a copy of the settings, without the setting descriptions.
        """
        return self.__settings

    def setSettings(self, settings):
        """
        Method for defining the settings for this object directly.

        This is required to allow for the command extension to work correctly.
        """
        self.__settings = settings

    def createToken(self, parent, info, page):
        """
        Method designed to be implemented by child classes, this method should create the
        token for the AST based on the regex match.

        Inputs:
            parent[tokens.Token]: The parent node in the AST for the token being created.
            info[LexerInformation]: Object containing the lexer information object.
            page[page.Page]: Page object of the current content being read.
        """
        raise NotImplementedError("The createToken method is required.")

class RenderComponent(Component, mixins.RendererObject):
    """
    RenderComponent objects are used to convert tokens to an output format such as HTML or LaTeX.

    The function to be called is assigned by the Renderer object; however, it has the following
    signature:
        functionName(self, parent, token, page):
            ...

    This allows the RenderComponent object to have multiple methods for converting to different
    formats. For example, the components in core.py have createHTML and createLatex methods to
    work with the HTMLRenderer and the LatexRenderer.
    """
    def __init__(self):
        """
        Constructs the object and sets the default settings of the object.
        """
        Component.__init__(self)
        mixins.RendererObject.__init__(self)
        self.__translator = None

    def setTranslator(self, translator):
        """
        To avoid pickling data as much as possible during Translator::execute the AST data
        after tokenization is stored on the translator object. The RenderComponent
        objects need the abiltiy to get the AST for other pages. The AST is only
        available across all pages after the translator completes tokenization. This requires
        that the retrieval method for the AST be limited to rendering (i.e., this class). Hence,
        the translator is needed here, for the getSyntaxTree method to work.
        """
        #check_type('translator', translator, Translator)
        self.__translator = translator

    def getSyntaxTree(self, page):
        return self.__translator.getSyntaxTree(page)
