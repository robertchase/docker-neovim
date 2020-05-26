function nv {
    local launch_dir=$(pwd)
    pushd ${DOCKER_NEOVIM:-${GIT:-$HOME/git}/docker-neovim} > /dev/null
    LAUNCH_DIR="$launch_dir" sh neovim.sh "$*"
    popd > /dev/null
}
