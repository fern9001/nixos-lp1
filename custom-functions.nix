{
  # Returns a list of subdirectory paths in a given drectory
  listSubdirectories = directoryPath:
    let
      # get set of items in directory
      dirContents = builtins.readDir directoryPath;

      # get list of attribute names (names of items in directory)
      itemNames = builtins.attrNames dirContents;
      # get list of attribute values (item type ie. file, directory)
      itemTypes = builtins.attrValues dirContents;

      # generate list checking if item is a subdirectory otherwise null
      dirList = builtins.genList (i: if (builtins.elemAt itemTypes i == "directory") then directoryPath + ("/" + (builtins.elemAt itemNames i )) else null ) (builtins.length itemTypes);

      # remove nulls from list
      dirListFilterd = builtins.filter (x: x != null) dirList;

    # return list of subdirectories
    in dirListFilterd;
}
