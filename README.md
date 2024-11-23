# In case I forget

## Install dependence

```sh
sudo pacman -S \
    stow \
    fzf \
    i3 \
    kitty \
    picom \
    ranger w3m \
    openssh \
    tmux \
    gvim \
    xinput
yay -S typora-free
```

## Restore all

```sh
ls | grep -v "README.md" | xargs stow --adopt
```
