CDF      
      
len_string     !   len_line   Q   four      	time_step          len_name   !   num_dim       	num_nodes      $   num_elem      
num_el_blk        num_node_sets         num_side_sets         num_el_in_blk1        num_nod_per_el1       num_side_ss1      num_side_ss2      num_nod_ns1       num_nod_ns2       num_nod_var       num_info   �   num_glo_var             api_version       @��H   version       @��H   floating_point_word_size            	file_size               title         out.e      maximum_name_length                    
time_whole                            Z�   	eb_status                             0   eb_prop1               name      ID              4   	ns_status         	                    8   ns_prop1      	         name      ID              @   	ss_status         
                    H   ss_prop1      
         name      ID              P   coordx                            X   coordy                            	x   eb_names                       $      
�   ns_names      	                 D      
�   ss_names      
                 D          
coor_names                         D      D   connect1                  	elem_type         QUAD4        �      �   elem_num_map                    d         elem_ss1                          |   side_ss1                          �   elem_ss2                          �   side_ss2                          �   node_ns1                          �   node_ns2                          �   vals_nod_var1                                Z�   vals_nod_var2                                \   vals_nod_var3                                ]0   vals_nod_var4                                ^P   name_nod_var                       �      �   info_records                      LD      �   name_glo_var                       $      Z�   vals_glo_var                             _p                              ?�      ?�      ?�333333?�333334?�      ?�333334?�      ?�333334?�      ?�333335?�      ?�333333?�������?�������?�������?�������?�������?���������������������������������������������������������333334��333333��333335��333334��333334��333334��      ��      ��      ��      ��      ��      ��      ��333333��333332��      ����������������?�������?�������?�333334?�333333?�      ?�      ��333334��      ��������?�������?�333334?�      ��333334��      ��������?�������?�333337?�      ��333334��      ��������?�������?�333334?�      ��333334��      ��������?�������?�333333?�                                                                                                                                                                                                                                                                                                	   
      	         
                                          
         
                                                                                                                                                       !            "   !         #   "         $   #                           	   
                                                                                                                        	             !   "   #   $disp_x                           disp_y                           resid_x                          resid_y                          ####################                                                             # Created by MOOSE #                                                             ####################                                                             ### Command Line Arguments ###                                                   -i                                                                               reaction.i                                                                                                                                                        ### Version Info ###                                                             Framework Information:                                                           SVN Revision:            71566121acf9d37e794965d0106f55db2c400d43                PETSc Version:           3.1.0                                                   Current Time:            Mon Aug 20 12:18:18 2012                                Executable Timestamp:    Mon Aug 20 11:13:04 2012                                                                                                                                                                                                  ### Input File ###                                                                                                                                                [AuxVariables]                                                                                                                                                      [./resid_x]                                                                        block                        =                                                   family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                                                                                                             [./resid_y]                                                                        block                        =                                                   family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                          []                                                                                                                                                                [BCs]                                                                                                                                                               [./left_x]                                                                         type                         = DirichletBC                                       boundary                     = 1                                                 value                        = 0                                                 variable                     = disp_x                                          [../]                                                                                                                                                             [./left_y]                                                                         type                         = DirichletBC                                       boundary                     = 1                                                 value                        = 0                                                 variable                     = disp_y                                          [../]                                                                                                                                                             [./right_x]                                                                        type                         = FunctionPresetBC                                  boundary                     = 4                                                 function                     = horizontal_movement                               variable                     = disp_x                                          [../]                                                                                                                                                             [./right_y]                                                                        type                         = PresetBC                                          boundary                     = 4                                                 value                        = 0                                                 variable                     = disp_y                                          [../]                                                                          []                                                                                                                                                                [Executioner]                                                                      l_abs_step_tol                 = -1                                              l_max_its                      = 100                                             l_tol                          = 0.001                                           nl_abs_step_tol                = 1e-50                                           nl_abs_tol                     = 1e-06                                           nl_max_funcs                   = 10000                                           nl_max_its                     = 200                                             nl_rel_step_tol                = 1e-50                                           nl_rel_tol                     = 1e-08                                           no_fe_reinit                   = 0                                               petsc_options                  = '-snes_mf_operator -ksp_monitor'                petsc_options_iname            = '-pc_type -pc_hypre_type -snes_type -snes_... ls -ksp_gmres_restart'                                                             petsc_options_value            = 'hypre boomeramg ls basic 101'                  scheme                         = backward-euler                                  type                           = Transient                                       _mesh                          = 0x7fd7fa04da00                                  abort_on_solve_fail            = 0                                               dt                             = 0.01                                            dtmax                          = 1e+30                                           dtmin                          = 1e-05                                           end_time                       = 0.1                                             growth_factor                  = 2                                               n_startup_steps                = 0                                               num_steps                      = 1000                                            predictor_scale                = 0                                               restart_file_base              =                                                 ss_check_tol                   = 1e-08                                           ss_tmin                        = 0                                               start_time                     = 0                                               sync_times                     = -1                                              time_dt                        =                                                 time_period_ends               =                                                 time_period_starts             =                                                 time_periods                   =                                                 time_t                         =                                                 trans_ss_check                 = 0                                               use_AB2                        = 0                                               use_littlef                    = 0                                             []                                                                                                                                                                [Functions]                                                                                                                                                         [./horizontal_movement]                                                            type                         = ParsedFunction                                    vals                         =                                                   value                        = t                                                 vars                         =                                                 [../]                                                                          []                                                                                                                                                                [Materials]                                                                                                                                                         [./1]                                                                              type                         = LinearIsotropicMaterial                           appended_property_name       =                                                   block                        = 1                                                 boundary                     =                                                   c                            =                                                   disp_x                       = disp_x                                            disp_y                       = disp_y                                            disp_z                       =                                                   poissons_ratio               = 0                                                 t_ref                        = 0                                                 temp                         =                                                   thermal_expansion            = 0                                                 youngs_modulus               = 1e+09                                           [../]                                                                          []                                                                                                                                                                [Mesh]                                                                             displacements                  = 'disp_x disp_y'                                 uniform_refine                 = 0                                               ghosted_boundaries             =                                                 ghosted_boundaries_inflation   =                                                 patch_size                     = 40                                              skip_partitioning              = 0                                               type                           = MooseMesh                                       block_id                       =                                                 block_name                     =                                                 boundary_id                    =                                                 boundary_name                  =                                                 centroid_partitioner_direction =                                                 construct_side_list_from_node_list = 0                                           partitioner                    =                                                 second_order                   = 0                                               file                           = 2d_square.e                                     nemesis                        = 0                                             []                                                                                                                                                                [Output]                                                                           elemental_as_nodal             = 1                                               exodus                         = 1                                               exodus_inputfile_output        = 1                                               file_base                      = out                                             gmv                            = 0                                               gnuplot_format                 = ps                                              interval                       = 1                                               iteration_plot_start_time      = 1.79769e+308                                    max_pps_rows_screen            = 0                                               nemesis                        = 0                                               num_restart_files              = 0                                               output_displaced               = 0                                               output_initial                 = 1                                               output_solution_history        = 0                                               output_variables               =                                                 perf_log                       = 1                                               postprocessor_csv              = 0                                               postprocessor_gnuplot          = 0                                               postprocessor_screen           = 1                                               print_linear_residuals         = 0                                               screen_interval                = 1                                               show_setup_log_early           = 0                                               tecplot                        = 0                                               tecplot_binary                 = 0                                               xda                            = 0                                             []                                                                                                                                                                [Postprocessors]                                                                                                                                                    [./react_x]                                                                        type                         = NodalSum                                          boundary                     = 4                                                 execute_on                   = timestep                                          output                       = both                                              variable                     = resid_x                                         [../]                                                                          []                                                                                                                                                                [SolidMechanics]                                                                                                                                                    [./solid]                                                                          appended_property_name       =                                                   block                        =                                                   disp_r                       =                                                   disp_x                       = disp_x                                            disp_y                       = disp_y                                            disp_z                       =                                                   save_in_disp_r               =                                                   save_in_disp_x               = resid_x                                           save_in_disp_y               = resid_y                                           save_in_disp_z               =                                                   temp                         =                                                   use_displaced_mesh           = 1                                               [../]                                                                          []                                                                                                                                                                [Variables]                                                                                                                                                         [./disp_x]                                                                         block                        =                                                   family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                                                                                                             [./disp_y]                                                                         block                        =                                                   family                       = LAGRANGE                                          initial_condition            = 0                                                 order                        = FIRST                                             scaling                      = 1                                                 initial_from_file_timestep   = 2                                                 initial_from_file_var        =                                                 [../]                                                                          []                                                                                  react_x                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ?�z�G�{?�z�G�{?�z�G�{?�bM��?�bM���?�z�G�{?�bM��	?�z�G�{?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?x�t�j~�?x�t�j?x�t�j?x�t�j-?x�t�j?x�t�j~�?pbM��?pbM��?pbM��]?pbM��N?pbM���?pbM��?`bM��?`bM��o?`bM��O?`bM��?`bM��=?`bM��$                                                                ��"%	�  <zSEv&          ����Wp         ���'Rp�         �~�گ�         <�tͳ  ��2  ��VI�  ��;�� ���Ν�� �����F  �}	7��  ���)C�� ��T.B  ��=� ������@ ���敀 ���@ <�4�3�  <��]�� ��qU΅� ��@X� ��ZpNBP <\*(DS                                                  A.�����A>����t>r�     �n�     A>�����>W�     A>��   �\�     A>��   ^>O�     A.�����>F      �\@     >K      �W`     >d     �^�     �`�     �M      �f0     >{p     >w@     �a�     >V�     >a�     �O�     >*      �mp     >l�     �Q`     �>������.��   �>��   �>��   f�>��   ��.��   �>]�_��ڰ>Ug�B���o���e>y#�uK�>_��4�]B�yL�>Y�R�O��T`'�x��A%W��AH�f�9��j>4��y��>{^x�d�L�͚N(�Y5���ؾe��.Fߠ�q��W��>UV&i_m.>b�!I�t�LЁ��>j��<�e���������>s��MC�>nu��޾{�M�}�6>{c`�㯽>y1xkxo�q�1��(��~��|tz>KtWx�s,>l3`���MF'T�F�Q��Ks|�>Z���QV>c|u�cv>`:U���[>Q�O݊��Ac�����?�z�G�{?�z�G�{?�z�G�{?�bM���?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?�bM���?�bM���?�bM���?�bM���?�bM���?�bM���?pbM���?pbM���?pbM���?pbM���?pbM���?pbM���                                                                <6
�1M� <8���;�         <4���         <1�0~<         <L�+`         <��tD  <@�,q� <<&�M( <A���6 <9��� <4��|8 <2��6x <:j1�  <=;�>-H <7~f�=h <>إd(f <=�$, <5[�1� <!L��'��< `b�\�<"���@ <%�}�F <4$}�@�*<<�
h(�                                                A>��   AN��   ��              AN��    >      AN��    >      AN�����        A>������              �      =�      �      =�      >       �$      =�      �      >      �"      >      >       >"      �       �              �      �N������>��    �N��    �N��   �N��    �>�������~=8��ξ���
�=�7H\�^=��ʷ�V�/�m':=ؕ>������o�\=���L��	�}�V:=�Ab;3��=�//HA����T����|�/B,����} />� �t>Y�rG�=�����|=�J���|=��;���=��j`e=���,&G�>��B��T=����������>y�=�I.Sqc�=������� �ذ}~��2��w��=£�e��,=眪A!�i=�K����=�y|�x����I�;���d��:Ƚ��8W-��q0мAs�    ?��Q��?��Q��?��Q��?��t�j~�?��t�j~�?��Q��?��t�j~�?��Q��?��t�j~�?��Q��?��t�j?��Q��?��t�j	?�n��O�<?�n��O�?�n��O�??�n��O�;?�n��O�;?�n��O�g?��t�j~�?��t�j~�?��t�j~�?��t�j?��t�j?��t�j~�?x�t�j~�?x�t�j?x�t�j~�?x�t�j
?x�t�j?x�t�j~�                                                                ��i�X(d ��u=�ր         �t��j�8         �`�&��         ��feϘ         ��n�x\ <f�o�@ �\�K��� <p#[� <eOh�h` <t� ��� <v��ev  <�5}6j� <�Zg�q� <���ی <�q�E�� <�:Bit� <�O��@<���3T <�0�Wt� <��1Z� <v�k/0 <V"��� �F��Ɛ�                                                 AF�`   AV�`   )�X      �Q�     AV�`   �W�     AV�_����>F      AV�_����>[�     AF�_����>J      >f@     �w�     >Y      �X      �g�     >z      >A      �4      >       >P      >S�     �Y      �(      >^�     >6      >C      >M      �j�     �V�`   �F�`   �V�`   �V�`   �V�_�����F�_����>Re�+cg�>`ǏN�5��hG�~^���e��o�>V	��0�AV����A>S�cc���>)��Ê�>Y�6�.��X�p�RC+>Il���蘾aL=I5>Rl�֏�J�9�&u~ >@0f�g��R(�tq8`�Cp���㶾;#�5j�R�P��B���>):6y�!�>X`:���>l���J>a�9%�>V��^>E�Z��:1>"ivw->Gseu��L����=5�c�B8�۾V#�}����P0;�9꨾7�j�l��R�o����G?In�-�>8��v�[>CS�P��A|�8    ?�z�G�{?�z�G�{?�z�G�{?�bM���?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?�z�G�{?�bM��?�z�G�{?�bM��?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j?�bM���?�bM���?�bM���?�bM���?�bM��?�bM���?�bM���?�bM��?�bM���?�bM��?�bM��?�bM���                                                                ��)`i�h ��Bz�         �t�9|c          �j�,�         �|^��`         ���dd <<^�L  �U´3� <_��� <X#I� <iP �;  <s���7P <�=0z� <��d�� <��1ӓ0 <�o�~-| <����d <��(&j@<|V	�̘ <p��` <��-� <xx>�M� <R� ��� �`���E�                                                 AN��   A^��   $�Z�     �K      A^��   �a�     A^�����>E      A^�����>c      AN�����>Q      >d@     �u@     >`�     �Q�     �d�     >u�     >0      �       �6      >F      >T      �^      >       >_      �      >G      >O      �f�     �^��   �N��   �^��   �^��   �^������N�����>I�g~��>X��yN7�_/��P�Zf�jq�>S�[}�x�G���>R[��YӚ�@
w�F��>R�G���O��RP�>A����u�Pin<��*>&��NN��8 �8>"�H�:��J������JKv,[m� q�CՀJ�NX���=n>'�BZ]��>T���n�>h3�Z��>Ts�:�]>CO��v`>0�`Oa;��A��>>RhV)iƇ=�Vs�?��Y���:nоT-
e����BGV�7��#�ͦp5V�MZ����E~�­>4�	���>?Bق�	�A��    ?�������?�������?�������?�z�G�x?�z�G�v?�������?�z�G�z?�������?�z�G�}?�������?�z�G��?�������?�z�G��?��Q��?��Q��?��Q��?��Q��?��Q��?��Q��?�z�G�y?�z�G�w?�z�G�|?�z�G�}?�z�G��?�z�G�u?�z�G�z?�z�G��?�z�G�}?�z�G��?�z�G�~?�z�G�`                                                                �w� r ��~��`         �g��{K�         �bE̐         �f�ƾ��         �k�S�  <?�G��  <W0�,� <S� � <]���{� <ho�F�` <t�=TT� <vtm�H <���G\ <{�q�0 <��c�� <��#q�� <�$�%�<qF�c9� <R�;�|@ <���_ <z���k� <d�H�P <,`AHt                                                  AS�   Ac�   �Y      �B      Ac�   �\      Ac�����>S      Ac�����>c      AS�����>8      >`      �q@     >U      �0      �Y      >p@     >      >(              �      >F      �a      >4      >X      >L      >F      >F      �c      �c�   �S�   �c�   �c�   �c������S�����>:r%�\�>J��p��L�H���TZ̾>Aɐ�؄>H���3��>�X����>GU4���'�E� [�5>?��ޜ��=P3ƨ�,>,�V=0� &�Wzо6AOH>2�]�z��4| ɣ���?	YD	iJ�Eu��S> 륋D\��L3߲\\9>-Իa�>D
*�R>`ny�pw�>5�e�f'j�#^֍���S'{ԾCY���N>U��y�>I��X��B�����B�{��ɾ=�ҰsHJ�=uYG��G ��־B���yÎ>X�lK��>1�o�"�A�׃����?��Q��?��Q��?��Q��?��t�j~�?��t�j~�?��Q��?��t�j~�?��Q��?��t�j~�?��Q��?��t�j~�?��Q��?��t�j~�?�n��O�<?�n��O�3?�n��O�=?�n��O�=?�n��O�>?�n��O�D?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j?��t�j~�?��t�j~�?��t�j~�?��t�j~�                                                                �d�:� �j�t��         <���          <,S �          �&����          <R�`�� <iB\$�@ <r��Sn� <r���� <v�$(p� <tC+�? <x܅��� <vO��� <~ $^Q& <x3���@ <��@�� <���� <~_�Չ <a[2X <2+~�  <x�6�E� <yP��l <dW�k  <EO8}i�                                                 AV�`   	Af�`   �`      �8      Af�`   �[      Af�_����>R      Af�_����>S      AV�_�����4      >Y      �i�     >N      �0      �@      >l      >       >H      >4      >(      >@      �b�     �       >L      >P      >B      >J      �Z      �f�`   �V�`   �f�`   �f�`   �f�_�����V�_����>)�bF�H{>6�v�����J"U�3�ܾЩ����>;���I᡾#"�b�*�>1���㺾;8Q^��>�A����@(?p�
�=�̓��><���\�6
��%e>>�qt)O>->̼vy�>@�؍��=������ 1Hf��E�'�>�v6{a�>$X1o�#>WIOr$�C>)p����u�;0Vo+`��B�e�@�=$�>N#��ơ�>PzDY�_��8@�����9�]���4�3�Ŵ>Y@� �ƾC1pyb+ݾ<<\�Ƀҽ�diF���>)���B�A��8   ?���Q�?���Q�?���Q�?��1&�x?��1&�w?���Q�?��1&�y?���Q�?��1&�z?���Q�?��1&�{?���Q�?��1&�|?��$�/?��$�/?��$�/?��$�/?��$�/?��$�/?��1&�}?��1&�?��1&�{?��1&�w?��1&�y?��1&�o?��1&�{?��1&�?��1&�|?��1&�z?��1&�u?��1&�c                                                                <]�*�  <i�I          <qi�GӰ         <q5Օ��         <k����         <w8g��` <~A���P <z]��� <�N�< <��b6�X <�G6�� <|,4�� <t�d�ڞ <{�K���<r�.�dp <}�G�p <���X� <}�?�� <I�Uu  �`	c@� <YPL   <`	iH���<_���� �=�L�                                                   AZ��   Aj��   
�T      �P      Aj��   �D      Aj��    >       Aj�������4      AZ������>      �(      �[      >D      �D      >      >]      >Q      >U      >B      �@      >J      �[      �4      >@      >T      �       >4      �R      �j��   �Z��   �j��   �j��   �j�������Z���������z�Z�5\�ξEֿ��0>5�����.�И�N>2̼<�O�:u���>�R�V	�8� ��A�7Թ�ئ� �{��&>G�~q >5��y T>5h��>H���>�>J�l�ӓ>"ʲJ8*�9q�j�2��"�Mrh>!bh:P�9�I�|>F���6^�>C�,����.Œ����e��XؾHT��j@�(%Y�N�*+�4m�O>o�m��C�B5��>�ś`p>`���\�"�)�Be�ׇL���>0K�󺴞>"]EJ���A��v   ?�z�G�{?�z�G�{?�z�G�{?�bM���?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?�z�G�{?�bM���?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?��t�j~�?�bM���?�bM���?�bM���?�bM���?�bM���?�bM���?�bM���?�bM��?�bM���?�bM���?�bM���?�bM���                                                                <q<�� <{�I�         <yK�ϑ�         <z�4�d@         <uF��C(         <~E�Jp <�nHb�� <|l��%� <�Hoї� <~�̈�X <�,�M�� <�	�=p <y9 0 <���TH� <g�{90 <q�p|9 <��j7� <�j�X�P <d�&�p <!<a�4  <)9j�^  <0{��� <m��2�X <b��b��                                                 A^��   An��   �`      �4      An��   >       An�����>      An�����>R      A^�����>(      �8      �N      >Z              >J      >T      >T      >0      >(      �^              �[      �P      >F      >\      >       >Q      �@      �n��   �^��   �n��   �n��   �n��   �^������/ ~.�r!�E����7�)1ɵ�>E*J	3;о@����ɾ>C����A�F�I>AQ���ݾH�U�%>>��K���0*#�)MB>D����>R+��k�6��[%B�w>�65-�8�
Ul���>N����
�,��7�>6o�g��>7��I���O:[_�P�?�_��,">G7�^[>
_�O��>D��N��}�Eb��$r�H-Bb��f�M %�~T>J�:z�V��0>�>:6�>�-�+d�=�ƽ�7��(h�$���)�	�^>$��-��>����A������?�
=p��
?�
=p��
?�
=p��
?�n��O�;?�n��O�:?�
=p��
?�n��O�<?�
=p��
?�n��O�;?�
=p��
?�n��O�<?�
=p��
?�n��O�=?���S���?���S���?���S���?���S���?���S���?���S���?�n��O�:?�n��O�:?�n��O�:?�n��O�:?�n��O�<?�n��O�9?�n��O�8?�n��O�>?�n��O�9?�n��O�:?�n��O�;?�n��O�5                                                                <#��q�� < �p�D          <=�44]�         <%��^�          <EҴ�`�         <V5;�  <b�{Ϥ@ <W���� <PC�y� <=�� <k�<��@ <t"��� <s��Y||@<z�7h�: <h�Ć���<kV��= <n�s��| <o]�0 <j���� <Y��s@ <m�� <hBw�P <h�u�� <`^�˰                                                 Aa*�   Aq*�   >@      �@      Aq*�    >\      Aq*�    �       Aq*�����>0      Aa*�����>8      �0      �\      �P      �D      �       >V                      >0              >H      �L      �D      >D      >L      �D      >L      �@      �q*������a*�    �q*�    �q*�   �q*�   �a*�����> �_���>-^Ӷ=�>
�����b>n0��〽�+��$�=��S/��(�jC޾-�~��>&{c� z����<� >Yi[F>.�Q���M=�ZடZ�7X��˾6/�hx�B�BL�?�+�>3}<@׸>/M����><9k�쓍>1FR
��G=�׫È�|��D|�{�����u��(�
���>;շ�N�5+T�d>9�u&�>�����~>=���|���0�r?�	M��p��⁾;-�
�n�7��U�e�"R��D���6��PA�u*    ?�������?�������?�������?�z�G�z?�z�G�z?�������?�z�G�{?�������?�z�G�{?�������?�z�G�{?�������?�z�G�{?��Q��?��Q��?��Q��?��Q��?��Q��?��Q��?�z�G�z?�z�G�z?�z�G�y?�z�G�z?�z�G�|?�z�G�y?�z�G�y?�z�G�~?�z�G�x?�z�G�{?�z�G�z?�z�G�u                                                                � ��Uf  <E���         �MH+ )�         �Nl��         ;��
�          <I6��р <XY�W  <Ao��� <%���� �Xgz�\ <8d'��� <X��a� <djR�ز�<f*��k� <c�Pp� <c�l <X��ஈ <P�Kr�� <__є <E~�&�@ <b@��]� <cU���� <e�c��� <]�Kڎ                                                  Ac�   As�   �R      �8      As�    >D      As�����>D      As������       Ac�    �0      �H      �0      >0      >8      �0      >H      >       �0      �H      �H      >V      �H      �0      >P      >@      >@              �H      �s������c�    �s�    �s�   �s�    �c�����=���wt>#��������Ir���>g����>(���TH��4 ѝϯL>pM�y���<�IT�z=���]c�=�6j�r>~�䶱�>*��߼׀>26se#s;,cԸ\�%���$�GR����=����Z� >>k��O>%�м[��=������>4sS�ɗH>,#�nH�h� w��ϰz�.:�F)�p>6N�SF�(�#�^>+ӽ���E>N�foy�>C
����> �d��d�ey���=�fQ$�3Ԃ�+7�0��$�a$��̓�e1��rA�ׄ    