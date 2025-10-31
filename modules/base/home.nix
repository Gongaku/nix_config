{
	flake.modules.homeManager.base =
	{ pkgs, ... }:
	{
		programs.home-manager.enable = true;

		backupFileExtension = ".bak";

		services = {
			home-manager.autoExpire = {
				enable = true;
				frequency = "weekly";
				store.cleanup = true;
			};
		};
	};
}
