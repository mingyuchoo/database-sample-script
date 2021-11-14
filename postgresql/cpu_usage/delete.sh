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
     -c "DELETE /* delete public.cpu_usage */
           FROM public.cpu_usage c
          USING ( SELECT min(id) as id
                    FROM public.cpu_usage
                ) s
          WHERE c.id  = s.id
            AND c.use = False"
# sleep 1
done

