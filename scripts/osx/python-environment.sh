# install python with homebrew's up-to-date OpenSSl
echo "Installing python with homebrew's up-to-date OpenSSL..."
if [ ! -f /usr/local/bin/python ]; then
	brew install python --with-brewed-openssl
fi

# install up-to-date pip's distribute
echo "Installing distribute with pip..."

# deactivating require virtualenv ;)
PIP_REQUIRE_VIRTUALENV=""
pip install --upgrade distribute

# intall virtualenv
echo "Installing virtualenv with pip..."
pip install --upgrade virtualenv

# install mkvirtualenvwrapper
echo "Installing mkvirtualenvwrapper with pip..."
pip install --upgrade virutalenvwrapper

# install ipython
echo "Installing ipython with pip..."
pip install --upgrade ipython
