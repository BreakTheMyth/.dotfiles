# In case I forget

## Install dependence

```sh
sudo pacman -S stow
```

## Quick restore

```sh
ls | grep -v "README.md" | xargs stow --adopt
```
