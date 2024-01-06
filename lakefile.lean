import Lake
open Lake DSL

package «import-all» where
  -- add package configuration options here

lean_lib «ImportAll» where
  -- add library configuration options here

@[default_target]
lean_exe «import_all» where
  root := `ImportAll
  supportInterpreter := true

@[default_target]
lean_exe «import_check» where
  root := `ImportCheck
  supportInterpreter := true
