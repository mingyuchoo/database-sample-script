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
     -c "SELECT count(*) 
           FROM public.cpu_usage"

#      -c "SELECT /* select public.cpu_usage */
#              id
#            , usage
#            , date
#            , time
#            , use
#         FROM public.cpu_usage" 
sleep 1
done

