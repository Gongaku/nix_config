topLevel@{
	config,
	...
}:
{
	flake.modules = {
		nixos.dev = {
			programs.git.enable = true;
		};

		homeManager.dev =
			{ config, ... }:
			{
				programs = {
					git = {
						enable = true;
						settings = {
							user.name = topLevel.config.flake.meta.users.${config.home.username}.name;
							user.email = topLevel.config.flake.meta.users.${config.home.username}.email;
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
	};
}
