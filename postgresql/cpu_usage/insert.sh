#! /bin/bash

export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=postgres
export PGUSER=postgres
export PGPASSWORD=postgres

while [ true ]
do

USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
DATE=$(date +%F)
TIME=$(date +%T)

psql --host=$PGHOST \
     --port=$PGPORT \
     --dbname=$PGDATABASE \
     --username=$PGUSER \
     -c "INSERT /* insert public.cpu_usage */
           INTO public.cpu_usage
              ( id
              , usage
              , date
              , time
              , use
              )
         VALUES
              ( DEFAULT
              , ${USAGE}
              , '${DATE}'
              , '${TIME}'
              , True
              )"
# sleep 1
done

