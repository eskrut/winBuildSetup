#!/bin/bash
mv /mingw64/bin/envsubst.exe /mingw64/bin/envsubst.exe.broken
mv /mingw32/bin/envsubst.exe /mingw32/bin/envsubst.exe.broken

pacman -Su --needed gettext
