#!/bin/bash

ss=$(curl -sL $(cat ~/.config/shadowsocks/ssurl) | base64 -d | sed '/^ss:/!d' | sed 's/^ss:\/\///g')

mkdir -p ~/.config/shadowsocks/list/
cd ~/.config/shadowsocks/list/

for i in $ss; do
    tag=$(echo $i | cut -d "#" -f 2 | xargs node -e "console.log(decodeURIComponent(process.argv[1]))")
    server=$(echo $i | cut -d "@" -f 2 | cut -d ":" -f 1)
    server_port=$(echo $i | cut -d "@" -f 2 | cut -d ":" -f 2 | cut -d "#" -f 1)
    decode=$(echo $i | cut -d "@" -f 1 | base64 -d)
    method=$(echo $decode | cut -d ':' -f 1)
    password=$(echo $decode | cut -d ':' -f 2)
    echo -e "\
{ \n\
    \"server\": \"$server\", \n\
    \"server_port\": $server_port, \n\
    \"local_address\": \"127.0.0.1\", \n\
    \"local_port\": 1080, \n\
    \"password\": \"$password\", \n\
    \"timeout\": 300, \n\
    \"method\": \"$method\", \n\
    \"fast_open\": false, \n\
    \"workers\": 1, \n\
    \"prefer_ipv6\": false \n\
}" > "$tag.json"
done
