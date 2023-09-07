FROM anatolelucet/neovim:stable as base

ARG BUILD_APT_DEPS="git wget curl tar bash gzip unzip python3"
RUN apk add --no-cache ${BUILD_APT_DEPS} && \
  curl -fLo /usr/local/share/nvim/runtime/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
  curl https://pyenv.run | bash

WORKDIR /root/
COPY .config .config
