#!/bin/bash

cd .

# -------------------------------- #
# https://www.postgresql.org/docs/current/app-pgdump.html
# Change Here
db_ip="127.0.0.1"
db_name="database_name"
db_schema="public" # "*" for all, read documentation
db_user="postgres"
db_port="5432"
# -------------------------------- #

dump_file=$db_name"_"`date +%Y.%m.%d_%H.%M`".sql"
dump_path=$db_name"_"`date +%Y.%m.%d_%H.%M`"_schema"

echo "Dump Starting..."
sleep 1
response=`/usr/bin/pg_dump --file $dump_file --host "$db_ip" --port $db_port --username $db_user --dbname $db_name --schema=$db_schema --schema-only`
echo "Dump Done"
sleep 1

echo "Parse Starting..."
rm -rf   "$dump_path"
mkdir -p "$dump_path"
while IFS= read -r line; do

    #echo $line
    if [[ $line == "-- PostgreSQL database dump" ]]; then
        name="database"
        type="CONFIG"
        schema="database"
        mkdir -p "$dump_path/$schema"
        mkdir -p "$dump_path/$schema/$type"
        file="$dump_path/$schema/$type/$name.sql"
        echo -n > "$file"
        echo "$schema | $type | $name"
    fi

    if [[ $line == --\ Name:* ]]; then
        name=$(echo "$line"   | awk -F'; ' '{print $1}' | awk -F': ' '{print $2}')
        type=$(echo "$line"   | awk -F'; ' '{print $2}' | awk -F': ' '{print $2}')
        schema=$(echo "$line" | awk -F'; ' '{print $3}' | awk -F': ' '{print $2}' | sed 's/;$//')
        if [ $schema == "" ] || [ $schema == "-" ]; then
            schema="database"
        fi
        mkdir -p "$dump_path/$schema"
        mkdir -p "$dump_path/$schema/$type"
        file="$dump_path/$schema/$type/$name.sql"
        echo -n > "$file"
        echo "$schema | $type | $name"
    fi

    if [[ $line == "-- PostgreSQL database dump complete" ]]; then
        file="$dump_path/done.sql"
        echo -n > "$file"
    fi

    if [[ -n "$file" ]]; then
        echo "$line" >> "$file"
    fi

done < "$dump_file"
echo "Parse Done"
sleep 1

echo "File Being Compressed"
sleep 1
mv $dump_file $dump_path

tar -czf `basename $dump_path`".tar.gz" `basename $dump_path`

if [ -f $dump_path".tar.gz" ]; then
    rm -rf "$dump_path"
fi
echo "File Compressed"

sleep 1
echo "File: "$dump_path".tar.gz"

