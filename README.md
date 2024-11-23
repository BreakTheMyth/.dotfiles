# In case I forget

## Install dependence

```sh
sudo pacman -S \
    stow \
    fzf xclip p7zip \
    i3 \
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
