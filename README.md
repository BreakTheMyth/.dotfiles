# In case I forget

## Install dependence

```sh
sudo pacman -S \
    stow \
    fzf bat chafa imgcat xclip p7zip \
    i3 feh rofi scrot \
    kitty \
    openssh \
    tmux \
    gvim \
    thefuck \
    thunar \
    wayland xorg-xwayland \
    hyprland waybar hyprpaper \
    yazi ffmpeg jq poppler fd ripgrep zoxide imagemagick
yay -S \
    picom-ftlabs-git \
    typora-free
```

## Restore all

```sh
ls | grep -v "README.md" | xargs stow --adopt
```
