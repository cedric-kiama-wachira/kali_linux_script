#!/bin/bash
systemctl start postgresql
systemctl enable postgresql

vi /etc/postgresql/16/main/postgresql.conf
listen_addresses = 'localhost'

systemctl restart postgresql
su - postgres
createdb -T template0 king_phisher -E UTF-8 -O king_phisher
exit

psql -h localhost -U king_phisher king_phisher

