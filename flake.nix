{
	description = "My cobbled together NixOS configuration";

	inputs = {
		# NixOS installation
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
		nixpkgs-master.url = "github:nixos/nixpkg/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		nixos-hardware.url = "github:nixos/nixos-hardware/master";

		# NixOS Home Manager. For managing one's home directory contents
		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixos-generators = {
			url = "github:nix-community/nixos-generators";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		pkgs-by-name-for-flake-parts.url = "github:grupol/pkgs-by-name-for-flake-parts";

		# Core of a distributed framework for writing Nix Flakes
		# More info: `https://flake.parts`
    flake-parts.url = "github:hercules-ci/flake-parts";

		# Import modules in a tree like hierarchy
    import-tree.url = "github:vic/import-tree";

		nix-webapps.url = "github:TLATER/nix-webapps";

		nixcord = {
			url = "github:KaylorBen/nixcord";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Nix Index tooling to quickly locate the package providing a certain
		# file in `nixpkgs`. It indexes built derivations found in binary caches
		nix-index-database = {
			url = "github:Mic92/nix-index-database";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# NixOS User Repository
		nur = {
			url = "github:nix-community/NUR";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# Firefox theme
		textfox.url = "github:adriankarlen/textfox";

		# Gaming
		nix-gaming.url = "github:fufexan/nix-gaming";
  };

	# Use a `Dendritic` pattern of nix configurations
	# More info: `https://vic.github.io/dendrix/Dendritic.html`
	outputs = inputs: inputs.flake-parts.lib.mkFlake {inherit inputs;} (inputs.import-tree ./modules);

}
