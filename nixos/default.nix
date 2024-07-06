{
  pkgs,
  config,
  liv,
  ...
}: {
  imports = [
    ./configuration.nix
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./users.nix
  ];

  config = {
    # automount disks
    services.gvfs.enable = true;
    # services.devmon.enable = true;
    programs.dconf.enable = true;
  };
}
