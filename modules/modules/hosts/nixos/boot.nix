{
	lib,
	config,
	...
}:
{
	flake.modules.nixos."hosts/nixos" = {
		boot = {
			loader = {
				# systemd-boot.enable = true;
				# efi.canTouchEfiVariables = true;
				grub = {
					enable = true;
					efiSupport = true;
					device = "/dev/sda";
				};
			};

			initrd.availableKernelModules = [
        "xhci_pci"
        "ehci_pci"
        "ahci"
        "usbhid"
        "usb_storage"
        "sd_mod"
        "sr_mod"
      ];

      kernelModules = [ "kvm-intel" ];
		};
		nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
		hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
	};
}
