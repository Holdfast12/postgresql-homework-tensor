#!/bin/bash
sudo pg_basebackup -R -D /var/lib/pgsql/13/data/ -h 192.168.1.2 -U postgres -P -v
sudo chown -R 26:26 /var/lib/pgsql/13/data/
sudo systemctl enable postgresql-13 --now