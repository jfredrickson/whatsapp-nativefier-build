#!/bin/sh

PLATFORM="linux"
ARCH="x64"
NAME="WhatsApp"
DIR="${NAME}-${PLATFORM}-${ARCH}"

nativefier https://web.whatsapp.com/ --zoom 1.1 --name $NAME --inject whatsapp-fix.js

# Change package name from 'whatsapp-nativefier-XXXXXX' to 'WhatsApp'
sed -i -E 's/whatsapp-nativefier-.{6}/$NAME/' ${DIR}/resources/app/package.json

# Fix permissions
find ${DIR} -type f -exec chmod go+r {} \;
find ${DIR} -type d -exec chmod go+rx {} \;
