#!/bin/sh

PLATFORM="linux"
ARCH="x64"

nativefier --zoom 1.33 --name whatsapp --inject whatsapp-fix.js https://web.whatsapp.com/

# Change package name from 'whatsapp-nativefier-XXXXXX' to 'WhatsApp'
sed -i -E 's/whatsapp-nativefier-.{6}/WhatsApp/' whatsapp-${PLATFORM}-${ARCH}/resources/app/package.json
