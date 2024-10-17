{
  description = "Lone Wanderers Example NixOS project";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lonewanderer = {
      url = "github:l0newander3r/nixos";
      inputs.home-manager.follows = "home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.snowfall.follows = "snowfall";
    };

    snowfall = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall.mkFlake {
      inherit inputs;

      src = ./.;

      channels-config = {
        allowUnfree = true;
        permittedInsecurePackages = [];
        config = {};
      };

      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };

      snowfall = {
        namespace = "lonewanderer.example";

        meta = {
          name = "lonewanderer-example";
          title = "Lone Wanderers Example NixOS project";
        };
      };

      systems.modules.nixos = with inputs; [
        lonewanderer.nixosModules.default
      ];

      homes.modules = with inputs; [
        lonewanderer.homeModules.default
      ];
    };
}
