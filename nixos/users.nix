{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.pan_svichka = {
        isNormalUser = true;
        description = "pan_svichka";
        extraGroups = ["networkmanager" "wheel"];
        packages = with pkgs; [
          #  thunderbird
        ];
      };
    }
  ];
}
