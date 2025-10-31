{
	flake.modules = {
		homeManager.shell =
			{ pkgs, ... }:
			{
				programs.bat = {
					enable = true;
					extraPackages = with pkgs.bat-extra; [
						batdiff
						batgrep
						batman
						batwatch
					];
				};
			};
	};
}
