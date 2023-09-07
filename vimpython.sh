HM_DEST=$1
PY3=$HM_DEST/.config/nvim/py3
eval "$(pyenv init -)";
echo "----- PYTHON 3 -----"
pyenv shell 3.11.5
pip install virtualenv -U
virtualenv $PY3
source $PY3/bin/activate && pip install -U neovim
