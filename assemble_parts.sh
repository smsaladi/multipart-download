#!/bin/bash

pre=$1
parts=$2

seq $parts | sed -e "s/^/${pre}\/${pre}.part./" -e 's/$/.out/' | parallel --max-args 100000 "cat {} > $pre.tar"


