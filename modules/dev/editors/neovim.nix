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
				};
			};
	};
}
