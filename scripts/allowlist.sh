#!/bin/bash
cd /server
if $ALLOW_LIST ; then
    if [[ $ALLOW_LIST_MEMBERS ]] ; then
        echo "Populating allowlist..."
        echo "[" > whitelist.json
        MEMBERS_JSON=()
        IFS=',' read -ra MEMBERS <<< "$ALLOW_LIST_MEMBERS"
        for i in "${MEMBERS[@]}"; do
            MEMBER_NAME=$(echo "$i")
            MEMBER_UUID_SHORT=$(curl -s -X GET "https://api.minecraftservices.com/minecraft/profile/lookup/name/$i" | jq -r .id)
            MEMBER_UUID=$(echo "${MEMBER_UUID_SHORT:0:8}-${MEMBER_UUID_SHORT:8:4}-${MEMBER_UUID_SHORT:12:4}-${MEMBER_UUID_SHORT:16:4}-${MEMBER_UUID_SHORT:20:12}")
            MEMBER_JSON=$(jq --null-input --arg uuid "$MEMBER_UUID" --arg name "$MEMBER_NAME" '{"uuid": $uuid, "name": $name}')
            echo "$MEMBER_JSON," >> whitelist.json
        done
        truncate -s-2 whitelist.json && echo -e "\n]" >> whitelist.json
        JSON=$(cat whitelist.json | jq)
        echo "$JSON" > whitelist.json
        echo "Done."
    else
        echo "WARNING: Allowlist is enabled, but no members are specified. Update the ALLOW_LIST_MEMBERS environment variable or populate whitelist.json to allow users to join the server."
    fi
else
    echo "Allowlist disabled."
fi
