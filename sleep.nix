let
  pkgs = import <nixpkgs> {};

  derivation-to-import = (pkgs.writeText "sleep" "
    pkgs: pkgs.stdenv.mkDerivation {
      name = \"depends-on-date\";
      dontUnpack = true;
      installPhase = ''
        mkdir $out
        echo ${builtins.getEnv "FOO"} > $out/out
      '';
    }

  ").overrideAttrs (old: { # to slow down the IFD
    doCheck = true;
    checkPhase = "sleep 5";
  });
  imported-derivation = import derivation-to-import;
  drv = imported-derivation pkgs;

in drv
