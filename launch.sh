DOCKER=${GIT:-$HOME/git}/docker-neovim

function nv {
    local launch_dir=$(pwd)
    pushd $DOCKER > /dev/null
    LAUNCH_DIR="$launch_dir" sh neovim.sh "$*"
    popd > /dev/null
}
