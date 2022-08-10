#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

# set database details
# crudini --set odoo-dev.conf options db_user $POSTGRES_USER
# crudini --set odoo-dev.conf options db_user $POSTGRES_USER
# crudini --set odoo-dev.conf options db_user $POSTGRES_USER
# crudini --set odoo-dev.conf options db_password $POSTGRES_PASSWORD
# crudini --set odoo-dev.conf options db_name $POSTGRES_DB

# add addons dirs to odoo-dev.conf
echo 'Resetting odoo-dev.conf addons_path...'
# list all addons dirs, strip new lines and extra spaces
crudini --set odoo-dev.conf options addons_path "$(ls --format=commas -d server/addons server/odoo/addons addons/* | tr '\n' ' ' | tr -d ' ')"
echo "addons_path has been set to: $(crudini --get odoo-dev.conf options addons_path)"
