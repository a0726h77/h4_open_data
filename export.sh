#!/bin/bash
#
# dump database to csv format
#

DB_USER=root
DB_PASSWORD=root
DB_DATABASE=h4

TABLES=( TpeMRTStations co_working_space conference_tags conference_websites conferences group_events group_tags group_websites groups place_suggestion )

for i in "${TABLES[@]}"
do
    mysql --user=$DB_USERNAME --password=$DB_PASSWORD $DB_DATABASE -e "SELECT * FROM $i INTO OUTFILE '/tmp/$i.csv' FIELDS TERMINATED BY ',' ENCLOSED BY '\"' LINES TERMINATED BY '\n'"
done

mv /tmp/*.csv .
