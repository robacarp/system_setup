#!/usr/bin/env bash

notes_file=/tmp/install_notes

function note {
  echo $1 >> $notes_file
}

echo > $notes_file

if [ ! -f ~/.ssh/id_rsa ] && [ ! -f ~/.ssh/id_ecdsa ] ; then
  echo "
It doesnt look like you have your private key setup.

Create a private key and make sure it's updated with github.
"
  exit 1
fi



# Install homebrew
which brew > /dev/null
if [ $? -ne 0 ] ; then
  echo Installing Homebrew...
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# setup git
ssh-keygen -F 'github.com' | grep 'github.com' > /dev/null 2> /dev/null

# fetch public keys from github
if [ $? -ne 0 ] ; then
  echo prefetching public keys from github...
  ssh-keyscan github.com >> ~/.ssh/known_hosts
fi

# install dotfiles repo
if [ ! -d ~/.dotfiles ] ; then
  git clone https://github.com/robacarp/config_files.git ~/.dotfiles
  ~/.dotfiles/install.pl > /dev/null
fi

# source casks.sh
# source brews.sh
source configs.sh

# Check to make sure fish shell is in etc/shells
grep 'fish' /etc/shells
if [ $? -ne 0 ]; then
  note
  note '# Add fish to the list of available shells'
  note 'echo /usr/local/bin/fish | sudo tee -a /etc/shells'
fi

note
note '# change default shell to fish'
note 'chsh -s /usr/local/bin/fish'


note
note 'If terminal settings havent been imported, the script load_terminal_settings.sh will perform the required tricks.'

echo
echo
echo 'Setup finished. Youll need to run these commands manually:'
cat $notes_file

echo


