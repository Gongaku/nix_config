{
	lib,
	...
}:
{
	flake.modules.nixos."hosts/nixos" = {
		boot = {
			loader = {

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
			hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
		};
	};
}
