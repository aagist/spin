#!/bin/bash

sleep $(($RANDOM % 150))
TIME=$(date '+%s')
SK=
RESULT=$(curl -X POST -H "User-Agent:GarenaGas/2.3.7.200 (Xiaomi MI 6; Android 30; zh-Hans; SG; ) dark" -H "Content-Type:application/x-www-form-urlencoded" -H "Content-Length:120" -H "Host:luckydraw2.gamehub.sg.garenanow.com" -H "Connection:Keep-Alive" -H "Accept-Encoding:gzip" -d "game=lol&sk=${SK}&region=SG&version=1643279258&tid=${TIME}" "http://luckydraw2.gamehub.sg.garenanow.com/service/luckydraw/")

echo $RESULT | jq .result.prize.item.name
