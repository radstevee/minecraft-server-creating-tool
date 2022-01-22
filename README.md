# minecraft-server-creating-tool
This is a simple bash-based tool to easily create a minecraft server on linux.

## Installing
Use this command to clone the file: 
```bash
curl https://raw.githubusercontent.com/radstevee/minecraft-server-creating-tool/main/minecraft-server-creating-tool.sh -o minecraft-server-creating-tool.sh
```
Use this command to make the file runnable: 
```bash
chmod +x minecraft-server-creating-tool.sh
```
## Running
Use this command to run it:
```bash
./minecraft-server-creating-tool.sh
```
## Errors
If the screen is instantly terminated, run this command to manually start the server:
```bash
java -jar server.jar
```

If you get an error like this:
```bash
Unsupported Java version detected (X.XX). Only up to Java XX is supported
```
then install a new Java version by using `sudo apt install openjdk-XX-jdk`

If you have any suggestions or questions, reach me up on Discord (Radsteve#8033) or on the issues tab.

## ToDo
[] Select how much ram to allocate and add it to the start.sh
