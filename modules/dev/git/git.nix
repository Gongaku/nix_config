topLevel@{
	config,
	...
}:
{
	flake.modules = {
		homeManager.dev =
			{ config, ... }:
			{
				programs = {
					git = {
						enable = true;
						userName = topLevel.config.flake.meta.users.${config.home.username}.name;
						userEmail = topLevel.config.flake.meta.users.${config.home.username}.email;
						extraConfig = {
							branch = {
								autosetuprebase = "always";
							};
							color = {
								ui = "auto";
							};
							init = {
								defaultBranch = "main";
							};
							push = {
								autoSetupRemote = true;
								default = "current";
							};
							pull = {
								default = "matching";
								rebase = true;
							};
						};
					};
				};
			};
	};
}
