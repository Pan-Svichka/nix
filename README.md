# nix
 My nixOs files

 In order to use copy git repo link and  write command 
```
git clone {paste your link here}
```
inside your user folder.
 Then 
```
cp /etc/nixos/hardware-configuration.nix ~/nix/nixos/hardware-configuration.nix
```
 And open code editor of your choice and open `~/nix folder`, and edit everything you need, also `$USER` values should be replaced with your system username.
  
```
sudo nixos-rebuild switch --flake .
```
and after reboot you login inside tty and run hyprland.
