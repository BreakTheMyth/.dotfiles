# In case I forget

## Install dependence

```sh
sudo pacman -S \
    stow \
    fzf bat chafa imgcat xclip p7zip \
    i3 feh rofi scrot \
    kitty \
    ranger w3m \
    openssh \
    tmux \
    gvim \
    thefuck \
    thunar \
    hyprland waybar hyprpaper
yay -S \
    picom-ftlabs-git \
    typora-free
```

## Restore all

```sh
ls | grep -v "README.md" | xargs stow --adopt
```
