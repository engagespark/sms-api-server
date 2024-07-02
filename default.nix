with import <nixpkgs> {};
let
	smppd = pkgs.buildGoModule {
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
in
{
	default = smppd;
	docker = pkgs.dockerTools.buildImage {
    	name = "smppd";
        tag = "latest";
        copyToRoot = pkgs.buildEnv {
          name = "smppd";
          paths = [
			pkgs.dockerTools.caCertificates
    		pkgs.dockerTools.usrBinEnv
    		pkgs.dockerTools.binSh
			smppd
         ];
        };
    config = {
      Cmd = [ "/bin/smppd" ];
    };
    compressor = "none"; # need this for `crane`
  };

}
