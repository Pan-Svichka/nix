# nix
 My nixOs files

 In order to use copy git repo link and write modified command presented under inside your user directory.
```
git clone {paste your link here}
```
 Then run
```
cp /etc/nixos/hardware-configuration.nix ~/nix/nixos/hardware-configuration.nix
```
 Open code editor of your choice and edit everything you need, also `$USER` values should be replaced with your system username.
  
 And after you done run
  
```
sudo nixos-rebuild switch --flake .
```
