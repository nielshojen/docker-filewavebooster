#!/bin/bash

/etc/init.d/fw-booster start
/usr/bin/tail -F /var/log/fwbooster.log
