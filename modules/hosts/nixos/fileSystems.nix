{
	flake.modules.nixos."hosts/nixos" =
	{ config, lib, ... }:
	{
		fileSystems."/" =
			{ device = "/dev/disk/by-uuid/6361b35d-834c-4597-b258-92bd040aa9e8";
				fsType = "ext4";
			};

		fileSystems."/boot" =
			{ device = "/dev/disk/by-uuid/8728-D7B4";
				fsType = "vfat";
				options = [ "fmask=0077" "dmask=0077" ];
			};

		swapDevices =
			[ { device = "/dev/disk/by-uuid/33e63045-03e5-4899-9461-85c12cb4a4d6"; } ];

		hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};
}
