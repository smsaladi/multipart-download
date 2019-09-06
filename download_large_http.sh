#!/bin/bash

pre=$1
url=$2

mkdir -p $pre

curl -sI $url |
    grep '^Content-Length:' | 
    cut -f2 -d' ' |
    parallel "python calc_parts.py {} 100" |
    tr ' ' '-' |
    parallel --progress --joblog ${pre}.joblog --retries 5 --delay 1 -j20 "curl -H 'Range: bytes={}' --output ${pre}/${pre}.part.{#}.out $url 2> ${pre}/${pre}.part.{#}.status"

