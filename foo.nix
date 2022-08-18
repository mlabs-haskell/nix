let
  pkgs = import <nixpkgs> {};
  derivation-to-import = pkgs.writeText "example" ''
    pkgs: pkgs.hello # builtins.getEnv "FOO"
  '';
  imported-derivation = import derivation-to-import;
  hello = imported-derivation pkgs;

in hello
