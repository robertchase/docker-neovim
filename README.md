# neovim in docker

Run neovim in docker against locally mounted directories.

Why install a bunch of crazy software directly on your box,
when `docker` allows you to bundle it up in a safe, tidy and replicable `image`?
This is the question that led to `docker-neovim`.

### hat tips

* The IDE-like `nvim` setup is lifted from this
[excellent explanation](https://yufanlu.net/2018/09/03/neovim-python/).

* The incomparable [FZF](https://github.com/junegunn/fzf#respecting-gitignore)
is used in both the `shell` and in `nvim`.

### setup

This `neovim` setup requires a number of plugins
which must be fetched from the internet.
Rather than fetch them every time the container
is `run`, the following steps allow them to be
fetched once, and added to the docker image.

1. `make build`
2. `make`
3. `nvim` (ignore errors)
4. `:PlugInstall`
5. exit `nvim`
6. `cp -r .config/nvim/plugged/
/opt/home/git/docker-neovim/config/plugged/`
7. exit container
8. `make build` again to pick up all the plugins

**Note:** the destination in step 6 may be different
based upon
where your `docker-neovim` repos is cloned.

It makes sense to to perform a `:PlugUpdate`
on occasion
to check for plugin updates.
The changes can be added to the
image by executing steps 6-8 again.

### assumptions

* repo is cloned in `~/git`; otherwise set `GIT`

### using `neovim.sh` and `nv`
