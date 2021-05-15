{
  listSubdirectories = directoryPath:
    let
      dirContents = builtins.readDir directoryPath;
      itemNames = builtins.attrNames dirContents;
      itemTypes = builtins.attrValues dirContents;
      dirList   = builtins.genList (i: if (builtins.elemAt itemTypes i == "directory") then directoryPath + ("/" + (builtins.elemAt itemNames i )) else null ) (builtins.length itemTypes);
      dirListFilterd = builtins.filter (x: x != null) dirList;
    in dirListFilterd;
}
