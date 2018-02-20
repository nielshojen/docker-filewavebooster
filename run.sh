#!/bin/bash

/etc/init.d/fw-booster start
/bin/sleep 10
/usr/bin/tail -F /var/log/fwbooster.log
