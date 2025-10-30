{
	flake.modules.nixos.sound = {
		services = {
			pipewire = {
				enable = true;
				alsa.enable = true;
				also.support32Bit = true;
				pulse.enable = true;
				jack.enable = true;
			};
		};
	};
}
