{
	inputs,
	...
}:
{
	flake.modules = {
		nixos.desktop =
			{ pkgs, ... }:
			{
			services = {
				desktopManager = {
					gnome.enable = true;
				};

				displayManager = {
					gdm = {
						enable = true;
						autoSuspend = false;
					};
				};

				xrdp = {
					enable = true;
					defaultWindowManager = "${pkgs.gnome-session}/bin/gnome-session";
					openFirewall = true;
				};
			};

			environment.systemPackages = with pkgs; [
					gnome-remote-desktop
					gnome-session
					xrdp
				];
		};
	};
}
