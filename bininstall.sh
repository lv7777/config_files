#kali linux install script
#apt-get install neovim mc tmux fish -y
echo "do U install browsers? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		apt-get install chromium -y	
	break;;
	* )
	echo "skip"
	break;;
esac
echo "do U install DockerCE? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		#from https://gist.github.com/nikallass/e5124756d0e2bdcf8981827f3ed40bcc
		apt-get remove docker docker-engine docker.io
		sudo apt-get update
		apt-get install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
		apt-key fingerprint 0EBFCD88
		echo "deb https://download.docker.com/linux/debian stretch stable" >> /etc/apt/sources.list
		apt-get update
		apt-get install docker-ce
	break;;
	* )
	echo "skip"
	break;;
esac

echo "do U install vscode? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
		sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
		sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
		sudo apt-get install apt-transport-https
		sudo apt-get update
		sudo apt-get install code # or code-insiders
		#OR
		#wget -o vscode.deb URL
		#dpdk -i vscode.deb
		#apt-get install -f
	break;;
	* )
	echo "skip"
	break;;
esac


echo "do U install ctf-script? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		git clone https://github.com/zardus/ctf-tools.git
		ctf-tools/bin/manage-tools setup && source ~/.bashrc && manage-tools list
	break;;
	* )
		echo "skip";
	exit
	break;;
esac


echo "do U install ctf-script? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		# if you error occured , you can ignored, and you can open as root!!!
		mkdir -p $HOME/tools/chrome
		cd $HOME/tools/chrome
		wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
		dependencies=$(dpkg -I google-chrome-stable_current_amd64.deb | grep --color=never "^ Depends" | sed -e "s/ Depends://g" | tr ',' '\n' | sed -e "s/ (>.\+)//g" | tr -d '\n')
		sudo apt -y install $dependencies
		sudo dpkg -i google-chrome-stable_current_amd64.deb
		apt --fix-broken install
		cd -
	break;;
	* )
		echo "skip";
	exit
	break;;
esac

echo "do U custmize 4 CTF? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		apt-get install strace -y
		#apt-get install  build-essential libtool g++ gcc texinfo curl wget automake autoconf python python-dev git subversion unzip virtualenvwrapper lsb-release -y
		#manage-tools install tor
		apt-get install torbrowser-launcher -y
		mv ~/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser ~/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser.old
		cp ./start-tor-browser ~/.local/share/torbrowser/tbb/x86_64/tor-browser_en-US/Browser/start-tor-browser
	break;;
	* )
		echo "skip";
	exit
	break;;
esac

echo "do U install WebFuck? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		git clone https://github.com/m---/webfuck.git
		#add now shell google-chrome --load-extension=~/webfuck/src/ --no-sandbox
	break;;
	* )
		echo "skip";
	exit
	break;;
esac

echo "do U install phpStorm OR intellij? [P(hpStorm)/i(ntelliJ)/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES"  | "P"  | "PhpStorm" | "PHPSTORM" | "phpstorm" )	
		apt-get install snap
		systemctl start snapd
		snap install phpstorm --classic
		#/snap/phpstorm/current/bin/phpstorm.sh
	break;;
	"i" | "intelliJ" | "INTELLIJ" | "intellij" )
		apt-get install snap
		systemctl start snapd
		snap install intellij-idea-community --classic --edge
		#/snap/intellij-idea-community/current/bin/idea.sh
	* )
		echo "skip";
	exit
	break;;
esac
