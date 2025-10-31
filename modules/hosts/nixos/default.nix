{
  config,
  ...
}:
{
  flake.modules.nixos."hosts/nixos".imports =
    with (config.flake.modules.nixos);
    [
      base
			desktop
			dev
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
					dev
          shell
        ];
      }
    ];
}

