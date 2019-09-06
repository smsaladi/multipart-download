#!/bin/bash

pre=$1
parts=$2

seq $2 | parallel -j1 -k "cat $pre/$pre.part.{}.out" > $pre.tar

