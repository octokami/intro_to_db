/*DROP database airbnb;
drop table reviews cascade;
drop table listings cascade;
drop table host cascade;
drop table reviewer cascade;
drop table host_location cascade;
drop table property cascade;
drop table calendar cascade;

create database airbnb*/
ALTER DATABASE airbnb SET datestyle TO "DMY";

CREATE TABLE reviewer
(
  reviewer_id INT NOT NULL,
  reviewer_name CHAR(128),
  PRIMARY KEY (reviewer_id)
);

CREATE TABLE host_location
(
  host_city CHAR(128) NOT NULL,
  host_state CHAR(128),
  host_country CHAR(64),
  PRIMARY KEY (host_city, host_state)
);

CREATE TABLE property
(
  property_type CHAR(64) NOT NULL,
  room_type CHAR(64),
  PRIMARY KEY (property_type)
);

CREATE TABLE host
(
  host_id INT NOT NULL,
  host_name CHAR(128),
  host_city CHAR(128),
  host_state CHAR(128),
  PRIMARY KEY (host_id),
  FOREIGN KEY (host_city, host_state) REFERENCES host_location(host_city, host_state)
);

CREATE TABLE listings
(
  listing_id INT NOT NULL,
  name CHAR(128),
  neighbourhood CHAR(128),
  review_scores_rating NUMERIC,
  host_id INT,
  property_type CHAR(64),
  PRIMARY KEY (listing_id),
  FOREIGN KEY (host_id) REFERENCES host(host_id),
  FOREIGN KEY (property_type) REFERENCES property(property_type)
);

CREATE TABLE calendar
(
  date DATE NOT NULL,
  available INT,
  price NUMERIC,
  minimum_nights NUMERIC,
  maximum_nights NUMERIC,
  listing_id INT,
  PRIMARY KEY (date, listing_id),
  FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
);

CREATE TABLE reviews
(
  review_id INT NOT NULL,
  review_date DATE,
  reviewer_id INT,
  listing_id INT,
  PRIMARY KEY (review_id),
  FOREIGN KEY (reviewer_id) REFERENCES reviewer(reviewer_id),
  FOREIGN KEY (listing_id) REFERENCES listings(listing_id)
);