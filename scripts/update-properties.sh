# Configure server properties
echo "Updating server properties..."
cd /server
sed -i "s/accepts-transfers=.*/accepts-transfers=$ACCEPTS_TRANSFERS/g" server.properties
sed -i "s/allow-flight=.*/allow-flight=$ALLOW_FLIGHT/g" server.properties
sed -i "s/allow-nether=.*/allow-nether=$ALLOW_NETHER/g" server.properties
sed -i "s/gamemode=.*/gamemode=$GAMEMODE/g" server.properties
sed -i "s/broadcast-console-to-ops=.*/broadcast-console-to-ops=$BROADCAST_CONSOLE_TO_OPS/g" server.properties
sed -i "s/broadcast-rcon-to-ops=.*/broadcast-rcon-to-ops=$BROADCAST_RCON_TO_OPS/g" server.properties
sed -i "s/bug-report-link=.*/bug-report-link=$BUG_REPORT_LINK/g" server.properties
sed -i "s/difficulty=.*/difficulty=$DIFFICULTY/g" server.properties
sed -i "s/enable-command-block=.*/enable-command-block=$ENABLE_COMMAND_BLOCK/g" server.properties
sed -i "s/enable-jmx-monitoring=.*/enable-jmx-monitoring=$ENABLE_JMX_MONITORING/g" server.properties
sed -i "s/enable-query=.*/enable-query=$ENABLE_QUERY/g" server.properties
sed -i "s/enable-rcon=.*/enable-rcon=$ENABLE_RCON/g" server.properties
sed -i "s/enable-status=.*/enable-status=$ENABLE_STATUS/g" server.properties
sed -i "s/enforce-secure-profile=.*/enforce-secure-profile=$ENFORCE_SECURE_PROFILE/g" server.properties
sed -i "s/enforce-whitelist=.*/enforce-whitelist=$ALLOW_LIST/g" server.properties
sed -i "s/entity-broadcast-range-percentage=.*/entity-broadcast-range-percentage=$ENTITY_BROADCAST_RANGE_PERCENTAGE/g" server.properties
sed -i "s/default-player-permission-level=.*/default-player-permission-level=$DEFAULT_PLAYER_PERMISSION_LEVEL/g" server.properties
sed -i "s/force-gamemode=.*/force-gamemode=$FORCE_GAMEMODE/g" server.properties
sed -i "s/function-permission-level=.*/function-permission-level=$FUNCTION_PERMISSION_LEVEL/g" server.properties
sed -i "s/gamemode=.*/gamemode=$GAMEMODE/g" server.properties
sed -i "s/generate-structures=.*/generate-structures=$GENERATE_STRUCTURES/g" server.properties
sed -i "s/generator-settings=.*/generator-settings=$GENERATOR_SETTINGS/g" server.properties
sed -i "s/hardcore=.*/hardcore=$HARDCORE/g" server.properties
sed -i "s/hide-online-players=.*/hide-online-players=$HIDE_ONLINE_PLAYERS/g" server.properties
sed -i "s/initial-disabled-packs=.*/initial-disabled-packs=$INITIAL_DISABLED_PACKS/g" server.properties
sed -i "s/initial-enabled-packs=.*/initial-enabled-packs=$INITIAL_ENABLED_PACKS/g" server.properties
sed -i "s/level-name=.*/level-name=$LEVEL_NAME/g" server.properties
sed -i "s/level-seed=.*/level-seed=$LEVEL_SEED/g" server.properties
sed -i "s/level-type=.*\:normal/level-type=$LEVEL_TYPE/g" server.properties
sed -i "s/log-ips=.*/log-ips=$LOG_IPS/g" server.properties
sed -i "s/max-chained-neighbor-updates=.*/max-chained-neighbor-updates=$MAX_CHAINED_NEIGHBOR_UPDATES/g" server.properties
sed -i "s/max-players=.*/max-players=$MAX_PLAYERS/g" server.properties
sed -i "s/max-tick-time=.*/max-tick-time=$MAX_TICK_TIME/g" server.properties
sed -i "s/motd=.*/motd=$MOTD/g" server.properties
sed -i "s/network-compression-threshold=.*/network-compression-threshold=$NETWORK_COMPRESSION_THRESHOLD/g" server.properties
sed -i "s/online-mode=.*/online-mode=$ONLINE_MODE/g" server.properties
sed -i "s/op-permission-level=.*/op-permission-level=$OP_PERMISSION_LEVEL/g" server.properties
sed -i "s/pause-when-empty-seconds=.*/pause-when-empty-seconds=$PAUSE_WHEN_EMPTY_SECONDS/g" server.properties
sed -i "s/player-idle-timeout=.*/player-idle-timeout=$PLAYER_IDLE_TIMEOUT/g" server.properties
sed -i "s/prevent-proxy-connections=.*/prevent-proxy-connections=$PREVENT_PROXY_CONNECTIONS/g" server.properties
sed -i "s/pvp=.*/pvp=$PVP/g" server.properties
sed -i "s/query.port=.*/query.port=$QUERY_PORT/g" server.properties
sed -i "s/rate-limit=.*/rate-limit=$RATE_LIMIT/g" server.properties
sed -i "s/rcon.password=.*/rcon.password=$RCON_PASSWORD/g" server.properties
sed -i "s/rcon.port=.*/rcon.port=$RCON_PORT/g" server.properties
sed -i "s/region-file-compression=.*/region-file-compression=$REGION_FILE_COMPRESSION/g" server.properties
sed -i "s/require-resource-pack=.*/require-resource-pack=$REQUIRE_RESOURCE_PACK/g" server.properties
sed -i "s/resource-pack=.*/resource-pack=$RESOURCE_PACK/g" server.properties
sed -i "s/resource-pack-id=.*/resource-pack-id=$RESOURCE_PACK_ID/g" server.properties
sed -i "s/resource-pack-prompt=.*/resource-pack-prompt=$RESOURCE_PACK_PROMPT/g" server.properties
sed -i "s/resource-pack-sha1=.*/resource-pack-sha1=$RESOURCE_PACK_SHA1/g" server.properties
sed -i "s/server-ip=.*/server-ip=$SERVER_IP/g" server.properties
sed -i "s/server-port=.*/server-port=$SERVER_PORT/g" server.properties
sed -i "s/simulation-distance=.*/simulation-distance=$SIMULATION_DISTANCE/g" server.properties
sed -i "s/spawn-monsters=.*/spawn-monsters=$SPAWN_MONSTERS/g" server.properties
sed -i "s/spawn-protection=.*/spawn-protection=$SPAWN_PROTECTION/g" server.properties
sed -i "s/sync-chunk-writes=.*/sync-chunk-writes=$SYNC_CHUNK_WRITES/g" server.properties
sed -i "s/text-filtering-config=.*/text-filtering-config=$TEXT_FILTERING_CONFIG/g" server.properties
sed -i "s/text-filtering-version=.*/text-filtering-version=$TEXT_FILTERING_VERSION/g" server.properties
sed -i "s/use-native-transport=.*/use-native-transport=$USE_NATIVE_TRANSPORT/g" server.properties
sed -i "s/view-distance=.*/view-distance=$VIEW_DISTANCE/g" server.properties
sed -i "s/white-list=.*/white-list=$ALLOW_LIST/g" server.properties