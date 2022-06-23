#!/bin/bash

sleep $(($RANDOM % 150))
ID=''
TOKEN=''
SK=''
TIME=$(date '+%s')

VERSION=$(curl -X GET -H "User-Agent:GarenaGas/2.3.7.200 (Android 30; zh-Hans; SG; ) dark" -H "Host:luckydraw2.gamehub.sg.garenanow.com" -H "Connection:Keep-Alive" -H "Accept-Encoding:gzip" "http://luckydraw2.gamehub.sg.garenanow.com/service/luckydraw/?sk=${SK}&region=SG&tid=${TIME}" | jq '.result.settings | .[].version')
RESULT=$(curl -X POST -H "User-Agent:GarenaGas/2.3.7.200 (Android 30; zh-Hans; SG; ) dark" -H "Content-Type:application/x-www-form-urlencoded" -H "Content-Length:120" -H "Host:luckydraw2.gamehub.sg.garenanow.com" -H "Connection:Keep-Alive" -H "Accept-Encoding:gzip" -d "game=lol&sk=${SK}&region=SG&version=${VERSION}&tid=${TIME}" "http://luckydraw2.gamehub.sg.garenanow.com/service/luckydraw/")
RESULT=$( [[ $RESULT =~ 'result' ]] && { echo $RESULT | jq '.result.prize.item.name'; echo -n; } || echo $RESULT | jq '.detail' )
echo $RESULT
curl -d "chat_id=$ID&text=Magic%20Spin%0a$RESULT" https://api.telegram.org/bot${TOKEN}/sendMessage --retry 3 --retry-delay 5 