  {
    foo = "bar"
  }:
  let
    pkgs = import <nixpkgs> {};
    drv = val: (pkgs.writeText "ifd" ''"${val} ${builtins.getEnv "FOO"}"'').overrideAttrs(old: {
      checkPhase = old.checkPhase + ''
        echo ${builtins.getEnv "FOO"}
        
        sleep 1
      '';
    });
    a = import (drv "a");
    b = import (drv "b");
  in "${a} ${b}"
