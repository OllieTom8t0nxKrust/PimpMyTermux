#!/bin/bash
touch ~/.hushlogin
clear
echo
echo "PIMPING TERMUX UP LIKE IT SHOULD..."
echo
apt update
apt upgrade -y
echo
echo "DONE UPGRADING!"
sleep 5
echo
echo "NOW SETTING UP SHARED STORAGE, ROOT-REPO, TSU, X11-REPO..."
echo
termux-setup-storage
sleep 10
apt install root-repo x11-repo tsu -y
echo
echo "NOW THAT WE ARE DONE FIXING THE BASICS UP."
sleep 5
echo "LET'S GEAR IT ALL UP! (⌐■_■)"
sleep 5
echo
echo "INSTALLING MUST HAVE TOOLS, INTERPRETERS, COMPILERS AND OTHER GOODIES..."
echo
apt install git wget python golang curl clang libllvm net-tools iproute2 fastfetch -y
echo
echo "DONE GEARING IT UP!"
sleep 5
echo
echo "NOW WE NEED TO MAKE THIS BEAST LOOK FRESH..."
sleep 5
echo "HOLD ON A SECOND."
echo
echo "SETTING UP OH-MY-ZSH AND SOME USEFUL PLUG-INS..."
sleep 5
echo
apt install zsh -y

sudo pacman -S mandoc --noconfirm

zsh -c '
echo "TESTING CONVENIENCE...";
sleep 1;
for msg in "Just cleanly ZSHelled." "Now we gotta go back and BASDH some stuff up for a clean end." "Headding back..."; do
    echo "$msg";
    sleep 2;
done;
echo "Just checking your shell's identity man, which is: $SHELL";
echo "Well, i guess if BASH is where we are at, keep on kicking it!";
echo "We mean no harm here hun, alright?";
echo "I Don"t know what you've heard about me, but its just the marvelous shell's name ;)";
sleep 5;
echo "Alright, let's get back to pimping your Termux up...";
sleep 5

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s zsh
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
echo
echo "DONE SETTING UP OH-MY-ZSH!"
sleep 5
echo
echo "FOR THE PLUG-INS TO WORK AS THEY SHOULD,"
sleep 5
echo
echo "MAKE SURE YOU TO INCLUDE THE PLUGIN CONFIGURATION BELOW INTO YOUR ~/.zshrc  FILE WHEN THE INSTALLATION PROCESS IS OCER:"
echo
echo "--------------------------------------"
echo "
plugins=(
            git
            zsh-autosuggestions
            zsh-syntax-highlighting
            )"
echo "--------------------------------------"
sleep 5
echo
echo "NOW YOU ARE ALL SET!"
echo
echo "AREN'T YOU AS FRESH AS A COLD BREEZE NOW, HEY? (⌐■_■)"
echo
echo "NOW, GIVING YOU ALL THE RIGHTS OF FRESHNESS..."
echo
echo "ALL DONE!"
# Switch to root if available; if not, continue.
if command -v su >/dev/null 2>&1; then
  su
fi
exit 0
## ERROR HANDLING - #1
# The $ZSH folder already exists (/data/data/com.termux/files/home/.oh-my-zsh
## FEAT +1# Increase sleep times for better reading
##  FEAT +2# Include progressbar
