eval "$(pyenv init -)";
echo "----- PYTHON 3 -----"
pyenv virtualenv 3.11 neovimpy3
pyenv activate neovimpy3
pip install -U neovim
