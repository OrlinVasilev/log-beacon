#!/usr/bin/env bash

COUNTER=1
while :
do
    echo "{\"counter\": \"${COUNTER}\", \"msg\": \"I'm a log-beacon!\", \"time\": \"$(date +%F-%T)\"}"
    COUNTER=$(($COUNTER+1))
    sleep 10
done
