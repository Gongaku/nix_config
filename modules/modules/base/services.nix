{
	flake.modules.nixos.base = {
		services = {
			packagekit.enable = true;
			flatpak.enable = true;
			# Limit the systemd journal to 100M of disk or the
			# last 3 days of logs, whichever happens first.
			journald.extraConfig = ''
				SystemMaxUse=100M
				MaxFileSec=3day
			'';
			nscd.enableNsncd = true;
			logind.settings.Login.HandleLidSwitch = "ignore";
			printing.enable = true;
		};
		systemd.sleep.extraConfig = ''
			AllowSuspend=no
			AllowHibernation=no
			AllowHybridSleep=no
			AllowSuspendThenHibernate=no
		'';

	};
}
