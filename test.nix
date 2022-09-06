  let
    drv = builtins.toFile "drv" ''
      foo: builtins.derivation {
        system = builtins.currentSystem;
        name = "ifd";
        builder = "sleep";
        inherit foo;
      }
    '';
    test = foo: (import drv) foo;
  in test
