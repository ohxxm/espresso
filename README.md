<div align="center">


```ocaml
Spaxly's NixOS Configuration
```
<br>

![alt text](https://github.com/Spaxly/espresso/blob/main/assets/desktop.png?raw=true)

```ocaml
IMMUTABLE / WIP / AESTHETIC
```
</div>

<h3 align="center">If you decide to use my config, please do give me credit in the README of your fork/repo.</center>
<br>
<br>

| Feature              | Package                                                           |
| -------------------- | ----------------------------------------------------------------- |
| Operating System     | [`NixOS`](https://www.nixos.org)                                  |
| Window Manager       | [`AwesomeWM`](https://github.com/awesomeWM/awesome)               |
| Compositor           | [`pijulius/picom`](https://github.com/pijulius/picom)             |
| Terminal             | [`WezTerm`](https://github.com/wez/wezterm)                       | 
| Shell                | [`fish`](https://www.fishshell.com/)                              |
| Editor               | [`neovim`](https://github.com/neovim/neovim)                      |
| Bar                  | [`wibar`](https://awesomewm.org/doc/api/classes/awful.wibar.html) |
| Application Launcher | [`rofi`](https://github.com/davatorium/rofi)                      |

# Install
 * Boot into NixOS Live Environment
 * Partition & Mount Drive(s)

```sh
# Go to mounted drive, create etc folder and go to etc folder
cd /mnt && mkdir etc && cd etc

# Create secureboot directory
mkdir /mnt/etc/secureboot

# Clone my configuration
git clone https://github.com/Spaxly/nixfiles

# Move my config to etc folder
mv nixfiles/nixos ./

# Generate hardware-configuration and configuration.nix file
nixos-generate-config --root /mnt

# Delete generated configuration.nix and move hardware-configuration.nix to the appropriate directory
rm configuration.nix && mv hardware-configuration.nix hosts/

# Install NixOS with my configuration
nixos-install --flake .#io --impure

# Verify files are signed for secure boot
sudo sbctl verify
```
### Reboot, enable secure boot and boot into newly installed NixOS
```
# Enroll secure boot keys
sudo sbctl enroll-keys --microsoft
```

#### I cannot guarantee that this config will work for you. Also, I use NixOS with secure boot enabled for Windows 11 so this config uses the Lanzaboote boot loader. You can find more information on there repo page, https://github.com/nix-community/lanzaboote.

# Post Configuration
### Installing NvChad
```bash
git clone https://github.com/NvChad/NvChad --depth 1 ~/.config/nvim
```

# WIP
* Finish bar configuration
* Dashboard
* Music player

# Credits

<a href="https://github.com/elenapan">Elenapan</a> - For rounded corners around windows without the use of a compositor
<br>
<a href="https://github.com/AlphaTechnolog/">AlphaTechnolog</a> - General reference
