# D  O  T  F  I  L  E  S

This repository contains the dotfiles for the tools I like to use.

## Configuring with GNU Stow

The configuration files in this repository are intended to be used with the
`stow` utility. This repository should work out-of-the-box and allow you to
manage the dotfiles with `stow`.

To manage these dotfiles with `stow`, first clone to a folder in your home
directory:

```bash
git clone https://github.com/daschfortner/dotfiles.git stow
```

Then use `stow` to deploy the dotfile configuration you want:

```bash
cd ~/stow
stow nvim
```

The `stow` utility will make symbolic links into your home directory following
the file structure dictated by the structure in the `stow` directory. For
example, since the neovim config is under `nvim/.config/nvim`, `stow` will
symlink the neovim config to `~/.config/nvim`.

You can remove stow configurations:

```bash
cd ~/stow
stow -D nvim
```

With this setup, you can make changes to the configuration in the `~/stow`
directory, commit them to this repository and push, without needing to pollute
your local system with disjointed git repositories.
