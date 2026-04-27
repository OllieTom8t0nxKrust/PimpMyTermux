clear
echo
echo "PIMPING TERMUX UP LIKE IT SHOULD..."
echo

pkg update
pkg upgrade -y
echo

echo "DONE UPGRADING!"
sleep 5
echo

echo "NOW SETTING UP SHARED STORAGE, ROOT-REPO, TSU, X11-REPO, FASTFETCH..."
echo

touch ~/.hushlogin
termux-setup-storage
sleep 10
pkg install root-repo x11-repo tsu fastfetch -y
echo

echo "NOW THAT WE ARE DONE FIXING THE BASICS."
sleep 5
echo "LET'S GEAR IT ALL UP! (⌐■_■)"
sleep 5
echo

echo "INSTALLING MUST HAVE TOOLS, INTERPRETERS, COMPILERS AND OTHER GOODIES..."
echo

pkg install git wget python golang curl clang libllvm net-tools iproute2 fastfetch mandoc -y
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

pkg install zsh -y
 
zsh -c '
echo "TESTING CONVENIENCE...";
sleep 1;
for msg in "Just cleanly ZSHelled." "Now we gotta go back to BASH to make everything clean." "Headding back..."; do
    echo "$msg";
    sleep 2;
done;
exit'
echo

echo "Just checking your shell identity, which is: ";
echo "$SHELL"
sleep 2;
echo "Alright, back to pimping your Termux up...";
sleep 5
 
# Install Oh-My-Zsh unattended if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

chsh -s zsh

# Clone plugins only if they don't exist
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
[ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
echo

echo "DONE SETTING UP OH-MY-ZSH!"
sleep 5
echo

echo "CONFIGURING PLUGINS IN .zshrc..."
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

echo "ADDING FASTFETCH TO .zshrc..."
printf "\n## -- FASTFETCH -- ##\nfastfetch\n" >> ~/.zshrc
echo

echo "NOW YOU ARE ALL SET!"
echo

echo "AREN'T YOU AS FRESH AS A COLD BREEZE NOW, HEY? (⌐■_■)"
echo

echo "NOW, GIVING YOU ALL THE RIGHTS OF FRESHNESS AS ROOT ..."
echo

# Switch to root if available; if not, continue.
if command -v su >/dev/null 2>&1; then
  su -c 'echo && echo "ROOT ACCESS GRANTED" && sleep 5; exit'
fi

echo "ALL DONE!"
sleep 2
echo "HAVE FUN! (⌐■_■)"

exit 0