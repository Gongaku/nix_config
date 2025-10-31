{
	flake.modules = {
		nixos.dev =
			{ inputs, pkgs, ... }:
			{
				programs = {
					neovim.enable = true;
				};
			};

		homeManager.dev =
			{ inputs, pkgs, ... }:
			{
				programs.neovim = {
					enable = true;
					# viAlias = true;
					package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
				};
			};
	};
}
