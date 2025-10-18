#!/bin/bash
touch ~/.hushlogin
mkdir -p ~/DOCUMENTS/GIT ~/DOCUMENTS/TOOLS ~/DOCUMENTS/GIT/ANDROID ~/DOCUMENTS/TOOLS/ANDROID/
clear
echo
echo "Pimping Termux up..."
echo
apt update && apt upgrade -y
echo
echo "Done upgrading!"
sleep 5
echo
echo "Setting up shared storage, root-repo, tsu, x11-repo..."
echo
termux-setup-storage
sleep 5
apt install root-repo x11-repo tsu -y
echo
echo "Now that we've finished the basics."
sleep 5
echo "Let's gear it all up! (⌐■_■)"
sleep 5
echo
echo "Installing must-have tools, interpreters, compilers and other goodies..."
echo
apt install git wget python golang curl clang libllvm net-tools iproute2 fastfetch -y
echo
echo "Done installing tools!"
sleep 5
echo
echo "Now we need to make this beast look fresh..."
sleep 5
echo "Hold on a second."
echo
echo "Setting up Oh My Zsh and some useful plugins..."
sleep 5
echo
apt install zsh -y

# pacman is not available in Termux by default; mandoc is optional. Uncomment and adjust if using a distro with pacman.
# sudo pacman -S mandoc --noconfirm

zsh -c "
echo "Running freshly installed ZSHELL...";
sleep 5;
echo "Just switched to zsh.";
sleep 3;
echo "The purpose of this fresh ZSHELL execution is to generate necessary config files.";
sleep 5;
echo "Now we gotta go back and fix some stuff for a clean end.";
sleep 5;
echo "Heading back...";
sleep 5;
"
echo
echo "Downloading and installing Oh My Zsh..."
sleep 5
echo
# Install Oh My Zsh using the official installer (uncomment the chsh if you want to change default shell)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "Oh My Zsh installed!"
echo "Adding plugins..."
sleep 5
chsh -s zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true
echo
echo "Done setting up Oh My Zsh!" 
sleep 5
echo
echo "For the plugins to work as they should,"
sleep 5
echo
echo "Make sure you include the following plugin configuration in your ~/.zshrc when the installation process is finished:"
echo
echo "--------------------------------------"
echo "plugins=(
                git
                zsh-autosuggestions
                zsh-syntax-highlighting
              )"
echo "--------------------------------------"
sleep 5
echo
echo "Now you are all set!"
echo
echo "Aren't you as fresh as a cold breeze now? (⌐■_■)"
echo
echo "Now, giving you all the rights of freshness..."
su -c "echo 'The roots of heaven are now yours. May you make the best of it! (⌐■_■) && sleep 5 && exit'"
echo
echo "All done!"
echo "--------------------------------------"
echo

# ERROR HANDLING - #1
# The $ZSH folder may already exist (/data/data/com.termux/files/home/.oh-my-zsh)
# FEAT +1: Increase sleep 5imes for better reading
# FEAT +2: Include progress bar
