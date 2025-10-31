{
	flake.modules.nixos.base =
	{ hostConfig, lib, ... }:
	{
		systemd = {
			services.NetworkManager-wait-online.enable = lib.mkForce false;
			network.wait-online.enable = false;
			network.enable = lib.mkForce false;
		};

		networking = {
			hostName = hostConfig.name;
			useDHCP = false;
			nftables.enable = true;
			search = [ ];
			networkmanager.enable = true;
			networkmanager.dns = "systemd-resolved";

			nameservers = [
				"9.9.9.9"
				"9.9.9.10"
				"9.9.9.11"
				"2620:fe::9"
				"2620:fe::10"
				"2620:fe::11"
			];

			firewall = {
				allowedTCPPorts = [
					# `SSH`
					22
					# `HTTP`
					80
					443
					# `SMB`
					445
					# `xRDP`
					3389
				];
				allowedUDPPorts = [
					# `xRDP`
					3389
				];
			};
		};
	};
}
