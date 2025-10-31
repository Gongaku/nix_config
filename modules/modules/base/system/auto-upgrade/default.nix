{
  flake.modules.nixos.base =
		{ inputs, ... }: {
    system.autoUpgrade = {
      enable = true;
      flake = inputs.self.outPath;
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
