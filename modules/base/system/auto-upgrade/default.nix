{
  flake.modules.nixos.base = {
    system.autoUpgrade = {
      enable = true;
      flake = "github:gongaku/nix_config";
      allowReboot = true;
			flags = [
				"--update-input"
				"nixpkgs"
				"-L" # Print build logs
			];
			dates = "02:00";
			randomizedDelaySec = "45min";
    };
  };
}
