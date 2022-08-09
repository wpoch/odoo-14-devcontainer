#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# add dynamic addons dirs to odoo-dev.conf
crudini --set .devcontainer/odoo-dev.conf options addons_path "$(ls -dm addons/* | tr -d ' ' | tr -d '\n')" # this will leave a trailing comma for the below command, they need to be used together because I'm to lazy to do this correctly
# add static addons dirs to odoo-dev.conf
crudini --set --list .devcontainer/odoo-dev.conf options addons_path "/workspace/server/addons,/workspace/server/odoo/addons"

echo 'To install any missing or changed server requirements'
echo 'pip3 install -r server/requirements.txt'

echo 'To run odoo server'
echo './server/odoo-bin --config .devcontainer/odoo-dev.conf'

echo 'To initalize db and run server:'
echo './server/odoo-bin -i base --config .devcontainer/odoo-dev.conf'
