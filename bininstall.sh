#kali linux install script
#apt-get install neovim mc tmux fish -y
echo "do U install browsers? [Y/n]"
read ANSER
case $ANSER in
	"" | "Y" | "y" | "yes" | "Yes" | "YES" )	
		apt-get install chromium -y	
	break;;
	* )
	exit
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
	exit
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
	exit
	break;;
esac
