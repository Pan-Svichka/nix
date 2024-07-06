{
  config,
  lib,
  pkgs,
  ...
}: {
  config = lib.mkMerge [
    {
      # Define a user account. Don't forget to set a password with ‘passwd’.
      users.users.$USER = {
        isNormalUser = true;
        description = "$USER";
        extraGroups = ["networkmanager" "wheel"];
        packages = with pkgs; [
          #  thunderbird
        ];
      };
    }
  ];
}
