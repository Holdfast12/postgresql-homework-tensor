#!/bin/bash
sudo -u postgres /usr/pgsql-13/bin/initdb -D /var/lib/pgsql/13/data/
sudo systemctl enable postgresql-13 --now
sudo cp /vagrant/db.out /var/lib/pgsql/13/data/
sudo chown 26:26 /var/lib/pgsql/13/data/db.out
sudo -u postgres psql -f /var/lib/pgsql/13/data/db.out
echo "host replication all 192.168.1.3/32 trust" | sudo tee -a /var/lib/pgsql/13/data/pg_hba.conf
echo "listen_addresses = '*'" | sudo tee -a /var/lib/pgsql/13/data/postgresql.conf
sudo systemctl restart postgresql-13
