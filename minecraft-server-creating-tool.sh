#!/bin/bash
# Check if ran with sudo permissions
if [ "$(id -u)" != "0" ]; then
	echo -e "Please run this script with sudo permissions."
	exit 1
fi

# Check if Java is installed
if [[ $(command -v java) ]]; then
    JAVAINSTALLED="true"
else
    JAVAINSTALLED="false"
fi
# Check if screen is installed
if [[ $(command -v screen) ]]; then
    SCREENINSTALLED="true"
else
    SCREENINSTALLED="false"
fi
# Check if java is not installed
if [ "$JAVAINSTALLED" == "false" ]; then
    read -r -p "If you press Enter, you will agree to installing screen." JAVAINSTALLAGREED
    if [ ${#JAVAINSTALLAGREED} -eq 0 ]; then
        apt install -y -q openjdk-16-jdk-headless
        echo "Java (16) is installed."
    fi
fi
# Check if screen is not installed
if [ "$SCREENINSTALLED" == "false" ]; then
    read -r -p "If you press Enter, you will agree to installing screen." SCREENINSTALLAGREED
    if [ ${#SCREENINSTALLAGREED} -eq 0 ]; then
        apt install -y -q screen
        echo "Screen is installed."
    fi
fi

read -r -p "Please name your server: " NAME
echo -e "Which server software should the server use? (Recommendation: Spigot)"
echo "1) Vanilla"
echo "2) Spigot"
echo "3) Craftbukkit"
echo "4) Paperspigot"

# Create Server-Software String to download the right software
# from https://github.com/MinehubDE/linux-beginner-scripts/blob/master/minecraft_server.sh
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
read -r -p "How much gigabytes of RAM do you want to allocate? (Please specify in Gigabyte, otherwise you're gonna run your server with 8192 Gigabytes of RAM) " RAM
mkdir -p "$LOCATION"

echo "Creating server..."

# Download server.jar
curl -s https://minecraft-mirror.io/"$SOFTWARE"-"$VERSION".jar -o "$LOCATION"/server.jar

# Create start.sh
cat > "$LOCATION"/start.sh << EOF
#!/bin/bash
screen -S $NAME java -Xms128M -Xmx$RAMG -jar server.jar nogui
EOF
echo 'eula=true' > "$LOCATION"/eula.txt

# Chmod the start.sh file
chmod +x "$LOCATION"/start.sh

echo -e "Your server is created! Use 'cd $LOCATION && ./start.sh' to start the server"
