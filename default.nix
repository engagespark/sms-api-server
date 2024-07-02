with import <nixpkgs> {};
{
   default = pkgs.buildGoModule {
      name = "smppd";
      #buildInputs = [ gocache ];
      src = pkgs.lib.sourceByRegex ./. [
        "go.(mod|sum)"
        "vendor"
        "vendor/.*"
        "main.go"
        "apiserver"
        "apiserver/.*"
      ];
      vendorHash = null; # uses ./vendor/
      doCheck = false;
    };
}
