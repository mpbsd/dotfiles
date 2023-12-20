#!/bin/bash

VENDOR_NAME='Wacom One by Wacom S Pen stylus'
DEVICE_TYPE='type: STYLUS'

TABLET_ID="$(xsetwacom --list devices | grep -E "${VENDOR_NAME}" | sed "s/\(${VENDOR_NAME}\|${DEVICE_TYPE}\|id:\)//g")"

xsetwacom --set ${TABLET_ID} Rotate half

exit 0
