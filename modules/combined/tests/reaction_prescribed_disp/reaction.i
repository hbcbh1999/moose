[Mesh]
  type = MooseMesh
  file = 2d_square.e
  displacements = 'disp_x disp_y'
[]

[Variables]
  [./disp_x]
  [../]
  [./disp_y]
  [../]
[]

[AuxVariables]
  [./resid_x]
  [../]
  [./resid_y]
  [../]
[]

[Functions]
  [./horizontal_movement]
    type = ParsedFunction
    value = t
  [../]
[]

[SolidMechanics]
  [./solid]
    disp_x = disp_x
    disp_y = disp_y
    save_in_disp_x = resid_x
    save_in_disp_y = resid_y
  [../]
[]

[BCs]
  [./left_x]
    type = DirichletBC
    variable = disp_x
    boundary = 1
    value = 0.0
  [../]
  [./left_y]
    type = DirichletBC
    variable = disp_y
    boundary = 1
    value = 0.0
  [../]
  [./right_x]
    type = FunctionPresetBC
    variable = disp_x
    boundary = 4
    function = horizontal_movement
  [../]
  [./right_y]
    type = PresetBC
    variable = disp_y
    boundary = 4
    value = 0.0
  [../]
[]

[Materials]
  [./1]
    type = LinearIsotropicMaterial
    block = 1
    disp_y = disp_y
    disp_x = disp_x
    poissons_ratio = 0.0
    youngs_modulus = 1e9
  [../]
[]

[Postprocessors]
  [./react_x]
    type = NodalSum
    variable = resid_x
    boundary = 4
  [../]
[]

[Executioner]
  type = Transient
  petsc_options = '-snes_mf_operator -ksp_monitor'
  petsc_options_iname = '-pc_type -pc_hypre_type -snes_type -snes_ls -ksp_gmres_restart'
  petsc_options_value = 'hypre    boomeramg      ls         basic    101'
  nl_abs_tol = 1e-6
  l_max_its = 100
  nl_max_its = 200
  dt = 0.01
  end_time = 0.1
  num_steps = 1000
  dtmin = 0.00001
  l_tol = 1e-3
[]

[Output]
  file_base = reaction_out
  interval = 1
  output_initial = true
  elemental_as_nodal = true
  exodus = true
  perf_log = true
[]
