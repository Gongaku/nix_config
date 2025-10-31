{
	flake.modules = {
		nixos.base =
			{ lib, ... }:
			{
				programs.vim.enable = true;
				programs.nano.enable = lib.mkForce false;
			};
	};
}
