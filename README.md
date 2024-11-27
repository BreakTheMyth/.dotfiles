# In case I forget

## Install dependence

```sh
sudo pacman -S \
    stow \
    ranger fzf bat chafa imgcat xclip p7zip \
    i3 feh rofi scrot \
    kitty \
    ranger w3m \
    openssh \
    tmux \
    gvim \
    xorg-xinput
yay -S \
    picom-ftlabs-git \
    typora-free
```

## Restore all

```sh
ls | grep -v "README.md" | xargs stow --adopt
```
