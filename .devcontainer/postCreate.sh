#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo 'To regenerate odoo-dev.conf run ./regenerate-odoo-conf.sh, running this now:'
./regenerate-odoo-conf.sh

echo 'To install any missing or changed server requirements'
echo 'pip3 install -r server/requirements.txt'

echo 'To run odoo server'
echo './server/odoo-bin --config odoo-dev.conf'

echo 'To initalize db and run server:'
echo './server/odoo-bin -i base --config odoo-dev.conf'
