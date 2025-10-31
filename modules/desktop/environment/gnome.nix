{
	inputs,
	pkgs,
	...
}:
{
	flake.modules.homeManager.desktop = {
		environment.systemPackages = with pkgs; [
			gnome.gnome-tweaks
		];
	};
}
