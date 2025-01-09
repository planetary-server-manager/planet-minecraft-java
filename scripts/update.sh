#!/bin/bash
echo "Updating server..."
cd /prep && \
SERVER_URL="$(curl 'https://www.minecraft.net/en-us/download/server' --compressed -H 'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:130.0) Gecko/20100101 Firefox/130.0' -H 'Accept-Language: en-US,en;q=0.5' | grep -o https://piston-data.mojang.com/v1/objects/.*/server.jar)"
curl "$SERVER_URL" -q -o server.jar && \
chmod +x server.jar && \
mv -f server.jar /server/server.jar && \
echo "Update complete."