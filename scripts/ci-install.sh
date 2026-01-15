#!/bin/bash

# Ref: https://github.com/nvim-treesitter/nvim-treesitter/blob/main/scripts/ci-install.sh

set -e

NVIM_TAG=${NVIM_TAG-nightly}
NVIM_TAG_WITH_V=$NVIM_TAG
if [[ $NVIM_TAG_WITH_V != v* ]]; then
  NVIM_TAG_WITH_V="v${NVIM_TAG_WITH_V}"
fi

download_release() {
  local asset=$1
  local url_base="https://github.com/neovim/neovim/releases/download"
  local url_primary="${url_base}/${NVIM_TAG}/${asset}"
  local url_fallback="${url_base}/${NVIM_TAG_WITH_V}/${asset}"

  if command -v curl >/dev/null 2>&1; then
    curl -fL "$url_primary" -o "$asset" || curl -fL "$url_fallback" -o "$asset"
  else
    wget "$url_primary" -O "$asset" || wget "$url_fallback" -O "$asset"
  fi
}

download_release_first() {
  local asset
  for asset in "$@"; do
    if download_release "$asset"; then
      echo "$asset"
      return 0
    fi
  done
  return 1
}

os=$(uname -s)
if [[ $os == Linux ]]; then
  archive=$(download_release_first "nvim-linux-x86_64.tar.gz" "nvim-linux64.tar.gz")
  tar -zxf "$archive"
  dir="${archive%.tar.gz}"
  sudo ln -s "$PWD/$dir/bin/nvim" /usr/local/bin
  rm -rf "$PWD/$dir/lib/nvim/parser"
elif [[ $os == Darwin ]]; then
  RELEASE_NAME="nvim-macos-$(uname -m)"
  archive=$(download_release_first "$RELEASE_NAME.tar.gz" "nvim-macos.tar.gz")
  tar -zxf "$archive"
  dir="${archive%.tar.gz}"
  sudo ln -s "$PWD/$dir/bin/nvim" /usr/local/bin
  rm -rf "$PWD/$dir/lib/nvim/parser"
else
  archive=$(download_release_first "nvim-win64.zip")
  unzip "$archive"
fi

