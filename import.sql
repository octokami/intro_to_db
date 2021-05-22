--Copy
COPY host_location(host_city,host_state,host_country) FROM '/host_location.csv' DELIMITER ',' CSV HEADER;
COPY host(host_id,host_name,host_city,host_state) FROM '/host.csv' DELIMITER ',' CSV HEADER;
COPY property(property_type,room_type) FROM '/property.csv' DELIMITER ',' CSV HEADER;
COPY listings(listing_id,name,host_id,neighbourhood,property_type,review_scores_rating) FROM '/listings.csv' DELIMITER ',' CSV HEADER;

COPY reviewer(reviewer_id,reviewer_name) FROM '/reviewer.csv' DELIMITER ',' CSV HEADER;
COPY reviews(listing_id,review_id,review_date,reviewer_id) FROM '/reviews.csv' DELIMITER ',' CSV HEADER;
COPY calendar(listing_id,date,available,price,minimum_nights,maximum_nights) FROM '/calendar.csv' DELIMITER ',' CSV HEADER;



/*--other commands
docker exec -t -i jads_postgres /bin/bash
ls


--importing to docker
docker cp /Users/camil/Desktop/DB/Project/dataset/calendar.csv jads_postgres:/calendar.csv
docker cp /Users/camil/Desktop/DB/Project/dataset/reviews.csv jads_postgres:/reviews.csv
docker cp /Users/camil/Desktop/DB/Project/dataset/reviewer.csv jads_postgres:/reviewer.csv
docker cp /Users/camil/Desktop/DB/Project/dataset/listings.csv jads_postgres:/listings.csv
docker cp /Users/camil/Desktop/DB/Project/dataset/host.csv jads_postgres:/host.csv
docker cp /Users/camil/Desktop/DB/Project/dataset/host_location.csv jads_postgres:/host_location.csv
docker cp /Users/camil/Desktop/DB/Project/dataset/property.csv jads_postgres:/property.csv


--Executing the import
docker cp /Users/camil/Desktop/DB/Project/import.sql jads_postgres:/
docker exec jads_postgres psql -U cami postgres -f import.sql


--dump on cmd
docker exec jads_postgres pg_dump -U cami airbnb > C:/Users/camil/Desktop/DB/Project/dump.sql*/