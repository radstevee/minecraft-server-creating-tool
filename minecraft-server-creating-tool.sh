#!/bin/bash
echo -e "IMPORTANT: This script requires openjdk-17-jdk and screen. (sudo apt install openjdk-17-jdk and sudo apt install screen)\nIf you don't have these packages, please cancel the script via CTRL+C."
echo -e "\n"
echo -e "\n"
echo -e "Which server software should the server use? (Recommendation: Spigot)"
echo "1) Vanilla"
echo "2) Spigot"
echo "3) Craftbukkit"
echo "4) Paperspigot"

CASE=1
while [ $CASE -ne 0 ]; do
	read -r -p "Please enter the number of the desired server software: " SOFTWARE_INT
	case $SOFTWARE_INT in
		1)
		SOFTWARE="minecraft_server"
		CASE=0
		;;
		2)
		SOFTWARE="spigot"
		CASE=0
		;;
		3)
		SOFTWARE="craftbukkit"
		CASE=0
		;;
		4)
		SOFTWARE="paperspigot"
		CASE=0
		;;
	esac
done
read -r -p "Enter version: (ex. 1.16.5) " VERSION
read -r -p "Where should the files be saved? (Will be created, if not existing.) (ex. /home/serverfiles) " LOCATION
mkdir -p "$LOCATION"

echo "Creating your server...."

curl -s https://minecraft-mirror.io/"$SOFTWARE"-"$VERSION".jar -o "$LOCATION"/server.jar

echo 'java -jar server.jar nogui' > "$LOCATION"/start.sh
echo 'eula=true' > "$LOCATION"/eula.txt

chmod +x "$LOCATION"/start.sh

echo -e "Your server is created! Use 'cd $LOCATION && chmod +x start.sh && ./start.sh' to start the server"
