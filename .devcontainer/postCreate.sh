#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

echo 'To regenerate odoo-dev.conf run ./bin/regen-conf, running this now'
./bin/regen-conf

echo 'To install any missing or changed server requirements'
echo './bin/pip-install-reqs'

echo 'To initalize db and run server, using odoo-dev.conf'
echo './bin/run-odoo'

echo 'To run odoo server without init=base, using odoo-dev.conf'
echo './bin/run-odoo --without-init'
