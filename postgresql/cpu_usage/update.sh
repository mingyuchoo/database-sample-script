#! /bin/bash

export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=postgres
export PGUSER=postgres
export PGPASSWORD=postgres

while [ true ]
do
psql --host=$PGHOST \
     --port=$PGPORT \
     --dbname=$PGDATABASE \
     --username=$PGUSER \
     -c "UPDATE /* update public.cpu_usage */
                public.cpu_usage c
            SET use = False
           FROM (SELECT min(id) as id
                   FROM public.cpu_usage 
                ) s
          WHERE c.id = s.id"
# sleep 1
done

