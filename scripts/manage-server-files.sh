# Check EULA
cd /server
SERVER_FILES=$(echo "$(ls /server)")
if [[ "$SERVER_FILES" == "server.jar" ]] ; then
    echo "Server directory empty. Populating files..."
    java -Xmx1024M -Xms1024M -jar server.jar nogui && \
    echo "Agreeing to EULA." &&  \
    sed -i "s/eula=false/eula=true/g" eula.txt && \
    echo "Done."
else 
    echo "Existing server files found."
fi
cd /scripts
./update-properties.sh