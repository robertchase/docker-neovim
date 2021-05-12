FROM python:3.7-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    git \
    neovim \
    python-neovim \
    python3-neovim \
    tree

RUN pip install --upgrade pip \
    neovim \
    jedi \
    flake8 \
    autopep8

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && yes | ~/.fzf/install

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN echo ". /root/custom.sh" >> /root/.bashrc
COPY custom.sh /root/
COPY config /root/.config/nvim/
