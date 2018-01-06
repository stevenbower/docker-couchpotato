#!/usr/bin/env bash

mkdir -p /config
mkdir -p /data

cd /couchpotato
touch /config/CouchPotato.cfg

exec /usr/bin/python /couchpotato/CouchPotato.py --data_dir /data/ --config_file=/config/CouchPotato.cfg --console_log
