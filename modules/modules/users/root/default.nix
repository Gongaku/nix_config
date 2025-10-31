{
	flake.modules = {
		nixos.root =
		{ pkgs, ... }:
		{
			users.users.root.shell = pkgs.zsh;
			users.users.root.initialPassword = "12345";
		};
	};
}
