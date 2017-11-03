HM_DEST=$1
PY36=$HM_DEST/.config/nvim/py36
PY27=$HM_DEST/.config/nvim/py27
eval "$(pyenv init -)";
echo "----- PYTHON 36 -----"
pyenv shell 3.6.3
pip install virtualenv -U
virtualenv $PY36
source $PY36/bin/activate && pip install -U neovim
echo "----- PYTHON 27 -----"
pyenv shell 2.7.13
pyenv version
pip install virtualenv -U
pyenv which virtualenv
virtualenv $PY27 -p `pyenv prefix`/bin/python
source $PY27/bin/activate && pip install -U neovim
