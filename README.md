# 🪐 Planetary Minecraft Java Server

> ⚠️ **Important**: Due to a plague of large tech companies training their AI models on people's code without consent, this project has been moved to a new repository. All code has been moved to:    
https://code.planetaryservermanager.io/
>
> ✊ The project is still and always will be open source. No licensing has changed, just repositories.  
>
> 🐳 Current containers will remain in place for anyone relying on them, but **they will not recieve any updates**. To get the latest containers, switch your image repository to:    
`code.planetaryservermanager.io/planetary-server-manager`

PSM container image for Minecraft Java. It provides tight integration with the [PSM API](https://github.com/planetary-server-manager/api-server).

# Secure by Default
All PSM servers are secure by default. This means that `ALLOW_LIST` is set to `true` by default. To play on the server you must add users to the `ALLOW_LIST_MEMBERS` environment variable ([see below](#environment-variables)).

You can disable this by setting `ALLOW_LIST` to `false`, but this is not recommended as **anyone** will be able to join your server.

# Auto Updates
Automatic updates are turned **on** by default. This will ensure the container always downloads the latest server version every time it starts. If you would like to stay on your current version and disable auto updates, set **AUTO_UPDATE** to **false**.

> **Note**: **AUTO_UPDATE** must be set to **true** for the first run of the container, otherwise no server will be downloaded.

# World Backups
### Enable Backups
Automatic backups are turned **off** by default. To utilize automatic backups, you will need to do the following:
* Set the **BACKUPS** environment variable to **true**.
* Map the **/backups** volume to your host.

If you would rather do your own backups manually, your (live) world is contained in the **/server/$LEVEL_NAME** folder. I **highly** recommend stopping your server before saving to avoid world corruption.

### How Backups Work
If **BACKUPS** is set to **true**, then each time the container is run, it will automatically create a backup of your **WORLD_NAME** in the **/backups** folder. Each backup will be appended with the date and time (%Y-%m-%d_%H-%M-%S format). 

> **Example**: If your world is called **"planetary-minecraft-server"**, and the map is saved on January 2nd, 2024 at exactly 3:45am, the backup will be called **"planetary-minecraft-server-20204-01-02_03-45-00"**.

# Volumes
> :warning: **Important**: It is highly recommended that you map these volumes to your host machine. Otherwise all save data and configuration will be lost when the container is deleted/updated.

| Path | Description |
| --- | --- |
| /server | This contains all your server files including configuration, worlds, and the server binary itself. |
| /backups | This contains all world backups (if they are enabled). See [World Backups](#world-backups) for more information. |

# Environment Variables
These environment variables map directly to the settings in the **server.properties** file.

## Common
> **Note** Most of this information is from the [Minecraft Wiki](https://minecraft.wiki/w/Server.properties). You may want to check there for more up-to-date information.

| Variable | Possible Values | Default Value | Notes | 
| --- | --- | --- | --- |
| ALLOW_LIST | boolean (true, false) | true | If set to **true**, only users in the **whitelist.json** file will be allowed to connect. It changes both `white-list` and `enforce-whitelist` in the **server. properties**. See `ALLOW_LIST_MEMBERS` below for adding members to this list.<br><br>**Note**: *Ops are automatically whitelisted, and there is no need to add them to the whitelist.*<br><br>This is a generalized variable that all PSM containers share. |
| ALLOW_LIST_MEMBERS | string (see Notes for formatting) | *null* | List of members to be added to **whitelist.json** file. Member names must be listed, separated by commas <br>Example:<br>`ALLOW_LIST_MEMBERS="username1,username2,username3"`<br>✨ This container will automatically populate user UUIDs from the Minecraft API. <br><br> This is a generalized variable that all PSM containers share. |
| AUTO_UPDATE | boolean (true, false) | true | See [Auto Updates](#auto-updates). |
| BACKUPS | boolean (true, false) | false | See [World Backups](#world-backups). |
| DIFFICULTY | peaceful, easy, normal, hard | easy | The [difficulty](https://minecraft.wiki/w/Difficulty) (such as damage dealt by mobs and the way hunger and poison affects players) of the server.<br>If a legacy difficulty number is specified, it is silently converted to a difficulty name.<br>peaceful (0)<br>easy (1)<br>normal (2)<br>hard (3) |
| GAMEMODE | survival, creative, adventure, spectator | survival | The default [game mode](https://minecraft.wiki/w/Game_mode).<br>If a legacy game mode number is specified, it is silently converted to a game mode name.<br>[survival](https://minecraft.wiki/w/Survival) (0)<br>[creative](https://minecraft.wiki/w/Creative) (1)<br>[adventure](https://minecraft.wiki/w/Adventure) (2)<br>[spectator](https://minecraft.wiki/w/Spectator) (3) |
| LEVEL_NAME | any string | "planetary-minecraft-server" | The world name and the world directory path.<br>If a directory at this path exists and is a valid world, it will be loaded by the server. If it doesn't exist or is not a valid world, the server will generate a new world in this directory, creating the directory and it's parents if necessary, and will use the provided value as its name. |
| LEVEL_SEED | any string | *null* | Use to randomize the world. If left empty, a seed is chosen at random. |
| MAX_PLAYERS | any 32-bit iteger | 10 | The maximum number of players that can be connected to the server at the same time. |
| MOTD | any string | "Deployed using the Planetary Server Manager" | The message displayed in the server list of the client, below the server name.<br>The MOTD supports [color and formatting codes](https://minecraft.wiki/w/Formatting_codes#Use_in_server.properties_and_pack.mcmeta).<br>The MOTD supports non-ASCII characters, such as "♥".<br>If the MOTD is over 59 characters, the server list may report a communication error. |

## Advanced
The following environment variables can also be set to modify the **server.properties** file. Please see the [Minecraft Wiki](https://minecraft.wiki/w/Server.properties) for more information on these properties.

| Variable | Default Value |
| --- | --- |
| ACCEPTS_TRANSFERS | false |
| ALLOW_FLIGHT | false |
| ALLOW_NETHER | true |
| BROADCAST_CONSOLE_TO_OPS |true |
| BROADCAST_RCON_TO_OPS | true |
| BUG_REPORT_LINK | "" |
| ENABLE_COMMAND_BLOCK | false |
| ENABLE_JMX_MONITORING | false |
| ENABLE_QUERY | false |
| ENABLE_RCON | false |
| ENABLE_STATUS | true |
| ENFORCE_SECURE_PROFILE | true |
| ENTITY_BROADCAST_RANGE_PERCENTAGE | "100" |
| FORCE_GAMEMODE | false |
| FUNCTION_PERMISSION_LEVEL | 2 |
| GENERATE_STRUCTURES | true |
| GENERATOR_SETTINGS | "{}" |
| HARDCORE | false |
| HIDE_ONLINE_PLAYERS | false |
| INITIAL_DISABLED_PACKS | "" |
| INITIAL_ENABLED_PACKS | "vanilla" |
| LEVEL_TYPE | "minecraft |:normal" |
| LOG_IPS | true |
| MAX_CHAINED_NEIGHBOR_UPDATES | "1000000" |
| MAX_TICK_TIME | "60000" |
| NETWORK_COMPRESSION_THRESHOLD | "256" |
| ONLINE_MODE | true |
| OP_PERMISSION_LEVEL | "4" |
| PAUSE_WHEN_EMPTY_SECONDS | "60" |
| PLAYER_IDLE_TIMEOUT | "0" |
| PREVENT_PROXY_CONNECTIONS | false |
| PVP | true |
| QUERY_PORT | "25565" |
| RATE_LIMIT | "0" |
| RCON_PASSWORD | "" |
| RCON_PORT | "25575" |
| REGION_FILE_COMPRESSION | "deflate" |
| REQUIRE_RESOURCE_PACK | false |
| RESOURCE_PACK | "" |
| RESOURCE_PACK_ID | "" |
| RESOURCE_PACK_PROMPT | "" |
| RESOURCE_PACK_SHA1 | "" |
| SERVER_IP | "" |
| SERVER_PORT | "25565" |
| SIMULATION_DISTANCE | "10" |
| SPAWN_MONSTERS | true |
| SPAWN_PROTECTION | "16" |
| SYNC_CHUNK_WRITES | true |
| TEXT_FILTERING_CONFIG | "" |
| TEXT_FILTERING_VERSION | "0" |
| USE_NATIVE_TRANSPORT | true |
| VIEW_DISTANCE | 10