# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

let
  userGroupList = [ "uid=1000" "gid=100" ];
in
{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  hardware.cpu.intel.updateMicrocode = true;

  boot.initrd.availableKernelModules = [
    "ehci_pci"
    "ahci"
    "firewire_ohci"
    "xhci_pci"
    "usb_storage"
    "usbhid"
    "sd_mod"
  ];

  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  services.fstrim.enable = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/01965894-c23d-443e-8dd3-6a9fef909eff";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/5A55-283F";
      fsType = "vfat";
    };

    "/mnt/bits" = {
      label = "bits";
      fsType = "ntfs3";
      options = [ "noatime" "ro" ] ++ userGroupList;
      noCheck = true;
    };

    "/mnt/gold" = {
      label = "gold";
      fsType = "ntfs3";
      options = [ "noatime" ] ++ userGroupList;
      noCheck = true;
    };
  };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/a34b1d68-a5d9-4ffe-b0a7-8dd02bc049d2"; }];

}
