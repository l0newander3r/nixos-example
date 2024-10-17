{pkgs, ...}: {
  boot.initrd.availableKernelModules = ["nvme" "thunderbolt" "xhci_pci" "usb_storage" "uas" "usbhid" "sd_mod"];

  lonewanderer.profiles = {
    desktop.enable = true;
    developer.enable = true;
    gaming.enable = true;
  };

  lonewanderer.hardware = {
    platform = "amd";
    video.amd.enable = true;
    # video.nvidia.enable = true;
  };

  lonewanderer.system = {
    hostId = ""; # create a unique host id
    domain = "localhst";
  };

  lonewanderer.system.user = {
    username = "user"; # set your username
  };

  lonewanderer.system.security.encryption.devices.system = {
    device = "/dev/disk/by-id/disk-id"; # device would not have a label, use IDs
    header = "/dev/disk/by-label/header-label";
    headerOffset = 0; # Set the desired offset from the key file
    offset = 0; # Set the desired offset from the key file
  };

  lonewanderer.system.security.backup = {
    enable = true;
    offset = 0; # Set the desired offset from the key file
  };

  system.stateVersion = "24.05";
}
