#!/bin/bash

NAME=$1
SHOW=$2

if [ "$SHOW" = "true" ];then
  echo "hello my name is $NAME"
else 
  echo "please mark the show option, if you want see my name."
fi
