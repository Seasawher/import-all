import Lean.Data.RBTree

open System

partial def getLeanFilePaths (fp : FilePath) (acc : Array FilePath := #[]) :
    IO $ Array FilePath := do
  if ← fp.isDir then
    (← fp.readDir).foldlM (fun acc dir => getLeanFilePaths dir.path acc) acc
  else
    return if fp.extension == some "lean" then acc.push fp else acc

open Lean

def getAllFiles (dirName : String) : IO $ List String := do
  let paths := (← getLeanFilePaths ⟨dirName⟩).map toString
  let paths : RBTree String compare := RBTree.ofList paths.toList -- ordering
  return paths.toList

def getImportsString (dirName : String) : IO String := do
    let paths ← getAllFiles dirName
    if paths.isEmpty then
      throw $ IO.userError "no files found"
    let imports := paths.map <| (fun p =>
        p.replace "/" "."
        |> (String.replace · "\\" ".")
        |> (String.replace · ".lean" "")
        |> ("import " ++ ·)
      )
    return s!"{"\n".intercalate imports}\n"
