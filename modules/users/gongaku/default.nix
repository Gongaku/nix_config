{
	config,
	...
}:
{
	flake = {
		meta.users = {
			gongaku = {
				email = "132847661+Gongaku@users.noreply.github.com";
				name = "Gongaku";
				username = "Gongaku";
			};
		};
		modules.nixos.gongaku =
		{ pkgs, lib, ... }:
			let
				user = config.flake.meta.users.gongaku;
			in
		{
			programs = {
			};

			environment.systemPackages = with pkgs; [
				cpufrequtils # CPU frequency scaling utilities
				dmidecode # DMI table decorder for hardware information
				exfat # ExFAT filesystem tool
				fuse
				gparted
				hwinfo # Hardware information tool
				ladspaPlugins # Required by audio servers
				libGL # Core graphics drivers
				lshw # Hardware lister
				mesa # OpenGL Implementation
				pciutils
				ryzenadj # Adjust power management for Ryzen CPUs
				spice # Remote display protocol
				spice-gtk # Virtualization infrastructure # GTK client for SPICE
				spice-protocol # SPICE protocol definitions
				usbutils # USB utilities
				util-linux
				virtio-win # VirtIO drivers for Windows guests
				virtiofsd # Shared filesystem daemon for VMs
				virt-manager # Desktop UI for managing virtual machines
				virt-viewer # UI for system virtualization
				xdg-utils # Desktop integration utilities

				avahi # Network discovery
				distrobox # Use any linux distro inside your terminal
			];

			users.users."${user.name}" = {
				description = "${user.name}";
				isNormalUser = true;
				createHome = true;
				extraGroups = [];
				shell = pkgs.zsh;
				initialPassword = "12345";
			};

			nix = {
				settings.trusted-users = [ "${user.username}" ];
				daemonCPUSchedPolicy =  "idle";
			};

			home-manager.users."${user.name}" =
			{ config, pkgs, ... }:
			{
				home = {
					xdg.config.files = {
						# Python LSP style
						# Ignore specific errors
						"pycodestyle".text = ''
							[pycodestyle]
							ignore = E226,E302,E41,W503,E501
						'';
					};

					packages = [
						kdePackages.dolphin
						kitty
						mpv
						steam
						steam-run # Run unpatched Linux programs

						## Misc
						cacert # Certificate Authority certificates
						dconf # Low-level configuration system for GNOME
						nvd # Diff tool for comparing Nix packages
						nettools
						openssl

						## CLI
						aria2
						bat # Interactive process viewer
						btop
						curl
						cpufetch # CPU architecture fetching tool
						czkawka # Multi-functional app to find duplicates, similar images, etc.
						dos2unix # Text file format converter
						exiftool # Read, write, and edit metadata
						ffmpeg # Complete solution for recording/converting audio/video
						ffmpegthumbnailer # Video thumbnailing library
						file # Determine file type
						fio # Flexible I/O tester
						fx # Terminal JSON viewr and processer
						fzf # Command-line fuzzy finder
						gawk # GNU awk for text processing
						gh # GitHub CLI
						git # Distributed version control system
						git-filter-repo # Tool for rewriting git repository history
						htop # Interactive process viewer
						imagemagick # Image manipulation tools
						iotop # I/O monitoring tools
						jq # Lightweight JSON processor
						killall
						lsof # List open files
						luarocks # Lua package manager
						networkmanager # Network connection manager
						networkmanagerapplet # Network Manager GUI applet
						powertop # Power consumption analyzer
						pv # Pipe Viewer for monitoring data transfer
						sqlite # Embedded SQL database engine
						sshpass # Non-interactive ssh password authentication
						sshuttle # VPN over SSH
						tmux # Terminal mulitplexer
						tree
						typst
						typstfmt
						tinymist # LSP server for typst
						zsh # Z shell
						zstd # Fast compression algorithm

						## Development
						comma
						gcc # GNU Compiler Collection
						gdb # GNU Debugger
						nil # Nix Language Server
						nix # Package manager
						nix-index # Files database for Nix packages
						nix-output-monitor # Improve nix-build output
						nix-top # Top-like utility for nix build processes
						nixd # Nix language server with rich diagnostics
						nixos-generators # Generate NixOS images for various formats
						vulnix # NixOS vulnerability scanner
						python3
					];
					programs = {
						bat.enable = true;
						zsh.enable = true;
					};
				};
			};
		};
	};
}
