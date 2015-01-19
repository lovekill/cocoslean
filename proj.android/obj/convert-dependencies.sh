#!/bin/sh
# AUTO-GENERATED FILE, DO NOT EDIT!
if [ -f $1.org ]; then
  sed -e 's!^D:/Develop/Cygwin/Cygwin/lib!/usr/lib!ig;s! D:/Develop/Cygwin/Cygwin/lib! /usr/lib!ig;s!^D:/Develop/Cygwin/Cygwin/bin!/usr/bin!ig;s! D:/Develop/Cygwin/Cygwin/bin! /usr/bin!ig;s!^D:/Develop/Cygwin/Cygwin/!/!ig;s! D:/Develop/Cygwin/Cygwin/! /!ig;s!^D:!/cygdrive/d!ig;s! D:! /cygdrive/d!ig;s!^C:!/cygdrive/c!ig;s! C:! /cygdrive/c!ig;' $1.org > $1 && rm -f $1.org
fi
