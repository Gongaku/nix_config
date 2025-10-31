{
	flake.modules = {
		homeManager.dev = {
			{ inputs, pkgs, ... }:
			{
				programs.neovim = {
					enable = true;
				};
			};
		};
	};
};
