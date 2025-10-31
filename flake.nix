{
	description = "My cobbled together NixOS configuration";

	inputs = {
		# NixOS installation
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-master.url = "github:nixos/nixpkgs/master";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		nixos-hardware.url = "github:nixos/nixos-hardware/master";

		# NixOS Home Manager. For managing one's home directory contents
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# Allows for the creation of various disk images and formats from a single NixOS config
		nixos-generators = {
			url = "github:nix-community/nixos-generators";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		# Core of a distributed framework for writing Nix Flakes
		# More info: `https://flake.parts`
    flake-parts.url = "github:hercules-ci/flake-parts";
		# Import modules in a tree like hierarchy
    import-tree.url = "github:vic/import-tree";
		# Fetch a package by its name for use in flake-parts
    pkgs-by-name-for-flake-parts.url = "github:drupol/pkgs-by-name-for-flake-parts";
		# Overlay for creating web apps in NixOS
		nix-webapps.url = "github:TLATER/nix-webapps";
		# Declarative define `Vencord` which is a Discord client
		nixcord = {
			url = "github:KaylorBen/nixcord";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# NixOS User Repository
		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

		systems.url = "github:nix-systems/default";

		# Firefox theme
		textfox.url = "github:adriankarlen/textfox";

		# Gaming
		nix-gaming.url = "github:fufexan/nix-gaming";
  };

	# Use a `Dendritic` pattern of nix configurations
	# More info: `https://vic.github.io/dendrix/Dendritic.html`
	outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

}
