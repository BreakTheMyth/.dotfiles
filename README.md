# In case I forget

## Install dependence

```sh
sudo pacman -S stow
```

## Restore all

```sh
ls | grep -v "README.md" | xargs stow --adopt
```
