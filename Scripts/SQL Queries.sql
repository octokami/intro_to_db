/*Student Name: Camila Matoba
 Student number: 2067717
Assignment for JBP051-B-6: Foundations of Databases
 Spring semester 2021
 AirBnb Amsterdam database
Task 4: SQL Queries*/

/*A) A query that uses an aggregate function in the SELECT, a GROUP BY and a HAVING.
 The average rating for each Amsterdam neighbourhood where it is 95% or higher.*/
select neighbourhood, round(avg(review_scores_rating),2) avg_rating
from listings
group by neighbourhood
having round(avg(review_scores_rating),2) >=95
order by avg_rating desc

/*B) A query that makes use of NOT IN in a WHERE or HAVING clause.
Summary of how many properties are there for each property type that is not a mobile property ('Boat', 'Houseboat', 'Yurt', 'Bus', 'Tipi', 'Camper/RV', 'Private room in houseboat', 'Private room in boat', 'Shared room in boat')*/
select property_type, count(*) num_properties
from listings
where property_type not in ('Boat', 'Houseboat', 'Yurt', 'Bus', 'Tipi', 'Camper/RV', 'Private room in houseboat', 'Private room in boat', 'Shared room in boat')
group by property_type
order by num_properties desc

/*C) A query that contains a window function.
 Top 10 increase in price per listing*/
select distinct listing_id, first_value(price) over (partition by listing_id order by price desc) - first_value(price) over (partition by listing_id order by price asc) price_change
from calendar
where price is not null
order by price_change desc
limit 10