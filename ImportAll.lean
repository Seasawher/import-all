import ImportAll.Base
/-!
This script generates the import list for a directory of Lean files.
* Almost all of this script is taken from <https://github.com/lurk-lab/yatima/blob/main/lakefile.lean>.
* <https://github.com/lurk-lab/yatima> is licensed under the MIT license.
-/

def main (args : List String) : IO UInt32 := do
  if args.length != 1 then
    throw $ IO.userError "usage: lake exe import_all <dirName>"
  let dirName := args[0]!
  let fileName := dirName ++ ".lean"

  IO.FS.writeFile ⟨fileName⟩ (← getImportsString dirName)
  return 0
