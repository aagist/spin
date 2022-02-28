#!/bin/bash

sleep $(($RANDOM % 150))
TIME=$(date '+%s')
SK=
VERSION=$(curl -X GET -H "User-Agent:GarenaGas/2.3.7.200 (Android 30; zh-Hans; SG; ) dark" -H "Host:luckydraw2.gamehub.sg.garenanow.com" -H "Connection:Keep-Alive" -H "Accept-Encoding:gzip" "http://luckydraw2.gamehub.sg.garenanow.com/service/luckydraw/?sk=${SK}&region=SG&tid=${TIME}" | jq '.result.settings | .[].version')
RESULT=$(curl -X POST -H "User-Agent:GarenaGas/2.3.7.200 (Android 30; zh-Hans; SG; ) dark" -H "Content-Type:application/x-www-form-urlencoded" -H "Content-Length:120" -H "Host:luckydraw2.gamehub.sg.garenanow.com" -H "Connection:Keep-Alive" -H "Accept-Encoding:gzip" -d "game=lol&sk=${SK}&region=SG&version=${VERSION}&tid=${TIME}" "http://luckydraw2.gamehub.sg.garenanow.com/service/luckydraw/")

echo $RESULT | jq .result.prize.item.name