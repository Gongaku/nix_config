{
	flake.modules = {
		homeManager.dev =
			{ pkgs, ... }:
			{
				programs.gh = {
					enable = true;
					extensions = [
						pkgs.gh-copilot
					];
				};
			};
	};

	nixpkgs.allowUnfreePackages = [
		"gh-copilot"
	];
}
