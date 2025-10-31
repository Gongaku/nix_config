{
	flake.modules.homeManager.base =
	{ pkgs, ... }:
	{
		programs.home-manager.enable = true;

		services = {
			home-manager.autoExpire = {
				enable = true;
				frequency = "weekly";
				store.cleanup = true;
			};
		};
	};
}
