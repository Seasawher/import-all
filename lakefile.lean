import Lake
open Lake DSL

package «import-all» where
  -- add package configuration options here

lean_lib «ImportAll» where
  -- add library configuration options here

lean_lib Tests where
  globs := #[.submodules `Tests]

@[default_target]
lean_exe «import_all» where
  root := `ImportAll

@[default_target]
lean_exe «import_check» where
  root := `ImportCheck
