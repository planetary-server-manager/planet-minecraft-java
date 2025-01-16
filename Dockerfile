FROM ghcr.io/planetary-server-manager/planetary-base:latest

LABEL maintainer="renegadespork"

ENV AUTO_UPDATE=true \
    BACKUPS=false \
    ACCEPTS_TRANSFERS=false \
    ALLOW_FLIGHT=false \
    ALLOW_NETHER=true \
    BROADCAST_CONSOLE_TO_OPS=true \
    BROADCAST_RCON_TO_OPS=true \
    BUG_REPORT_LINK="" \
    DIFFICULTY="easy" \
    ENABLE_COMMAND_BLOCK=false \
    ENABLE_JMX_MONITORING=false \
    ENABLE_QUERY=false \
    ENABLE_RCON=false \
    ENABLE_STATUS=true \
    ENFORCE_SECURE_PROFILE=true \
    ENTITY_BROADCAST_RANGE_PERCENTAGE="100" \
    FORCE_GAMEMODE=false \
    FUNCTION_PERMISSION_LEVEL=2 \
    GAMEMODE="survival" \
    GENERATE_STRUCTURES=true \
    GENERATOR_SETTINGS="{}" \
    HARDCORE=false \
    HIDE_ONLINE_PLAYERS=false \
    INITIAL_DISABLED_PACKS="" \
    INITIAL_ENABLED_PACKS="vanilla" \
    LEVEL_NAME="planetary-minecraft-server" \
    LEVEL_SEED="" \
    LEVEL_TYPE="minecraft\:normal" \
    LOG_IPS=true \
    MAX_CHAINED_NEIGHBOR_UPDATES="1000000" \
    MAX_TICK_TIME="60000" \
    MOTD="Deployed using the Planetary Server Manager" \
    NETWORK_COMPRESSION_THRESHOLD="256" \
    ONLINE_MODE=true \
    OP_PERMISSION_LEVEL="4" \
    PAUSE_WHEN_EMPTY_SECONDS="60" \
    PLAYER_IDLE_TIMEOUT="0" \
    PREVENT_PROXY_CONNECTIONS=false \
    PVP=true \
    QUERY_PORT="25565" \
    RATE_LIMIT="0" \
    RCON_PASSWORD="" \
    RCON_PORT="25575" \
    REGION_FILE_COMPRESSION="deflate" \
    REQUIRE_RESOURCE_PACK=false \
    RESOURCE_PACK="" \
    RESOURCE_PACK_ID="" \
    RESOURCE_PACK_PROMPT="" \
    RESOURCE_PACK_SHA1="" \
    SERVER_IP="" \
    SERVER_PORT="25565" \
    SIMULATION_DISTANCE="10" \
    SPAWN_MONSTERS=true \
    SPAWN_PROTECTION="16" \
    SYNC_CHUNK_WRITES=true \
    TEXT_FILTERING_CONFIG="" \
    TEXT_FILTERING_VERSION="0" \
    USE_NATIVE_TRANSPORT=true \
    VIEW_DISTANCE=10

EXPOSE 25565/tcp
EXPOSE 25565/udp

RUN apt-get update
RUN apt-get install default-jre -y

RUN usermod -l minecraft ubuntu

COPY /scripts /scripts

RUN chmod -R 770 /scripts && chown -R minecraft /scripts

USER minecraft

CMD ["/bin/bash", "/scripts/bootstrap.sh"]