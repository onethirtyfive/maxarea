{ pkgs ? import <nixpkgs> {} }:
let
  inherit (pkgs) bundlerEnv lib ruby_3_3;

  areaExerciseBundlerEnv = bundlerEnv {
    name = "area-exercise-bundlerenv";
    ruby = ruby_3_3; # from nixpkgs-unstable
    gemdir = ./.;
  };

in pkgs.mkShell {
  pname = "area-exercise-devenv";
  version = "0.1";

  src = lib.sources.sourceByRegex ./. [ "shell.nix" ];

  buildInputs = with pkgs; [
    bundix
    ruby_3_3
  ] ++ [areaExerciseBundlerEnv];
}
