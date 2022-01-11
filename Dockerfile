FROM python:3.10-slim

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    curl \
    git \
    neovim \
    python3-neovim \
    tree

RUN pip install --upgrade pip \
    neovim \
    jedi \
    flake8 \
    autopep8

RUN curl -L -o bat-musl_0.18.1_amd64.deb https://github.com/sharkdp/bat/releases/download/v0.18.1/bat-musl_0.18.1_amd64.deb && dpkg -i bat-musl_0.18.1_amd64.deb

RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && yes | ~/.fzf/install

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN echo ". /root/custom.sh" >> /root/.bashrc
COPY custom.sh /root/
COPY config /root/.config/nvim/
