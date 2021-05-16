{ config, pkgs, ... }:

let
  customFunctions = import ./custom-functions.nix;
  apps = customFunctions.listSubdirectories ./apps;
  system = customFunctions.listSubdirectories ./system;

in { imports = system ++ apps; }
