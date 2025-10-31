{
  config,
  ...
}:
{
<<<<<<< HEAD
	flake.modules.nixos."hosts/nixos".imports =
		with (config.flake.modules.nixos); [
			base
			gongaku
			openssh
			root
			shell
		] ++ [
			{
				home-manager.users.gongaku.imports = with config.flake.modules.homeManager; [
					base
					shell
				];
			}
		];
=======
  flake.modules.nixos."hosts/nixos".imports =
    with (config.flake.modules.nixos);
    [
      base
			desktop
      gongaku
      openssh
      root
      shell
    ]
    ++ [
      {
        home-manager.users.gongaku.imports = with config.flake.modules.homeManager; [
          base
					desktop
          shell
        ];
      }
    ];
>>>>>>> eb0de9e (Updated system)
}

