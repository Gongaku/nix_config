{
	inputs,
	config,
	...
}:
{
	nixpkgs.allowedUnfreePackages = [
		"steam"
		"discord"
		"spotify"
	];
	flake.modules = {
		nixos.desktop =
		{ pkgs, lib, config, ... }:
		{
			xdg = {
				autostart.enable = true;
				portal = {
					xdgOpenUsePortal = true;
					wlr.enable = true;
				};
			};

			nixpkgs = {
				config = {
					allowBroken = false;
					allowUnsupportedSystem = true;
					permittedInsecurePackages = [ ];
					allowAliases = true;
					enableParallelBuildingByDefault = false;
					showDerivationWarnings = [ ];
				};
			};

			services = {
				xserver = {
					excludePackages = with pkgs; [ xterm ];
					enable = lib.mkForce false;
					videoDrivers = [ "modesetting" ];
					xkb = {
						layout = "us";
						variant = "";
					};
				};

				desktopManager = {
					gnome.enable = true;
				};

				displayManager = {
					gdm = {
						enable = true;
						autoSuspend = false;
					};
					autoLogin = {
						enable = true;
						user = "${config.preferences.user.username}";
					};
				};
			};


			environment.defaultPackages = lib.mkForce [
				pkgs.rsync
				pkgs.parted
				pkgs.gptfdisk
				pkgs.e2fsprogs
			];
		};

		homeManager.desktop =
		{ pkgs, ... }:
		{
			xdg.portal.xdgOpenUsePortal = true;
			nixpkgs = {
				config.allowUnfree = true;
				overlays = [ inputs.self.overlays.default ];
			};
			services = {
				network-manager-applet.enable = true;
			};
			home.packages = with pkgs; [
				kdePackages.dolphin
			];
		};
	};
}
