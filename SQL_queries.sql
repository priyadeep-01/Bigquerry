/*query 1- build a query that orders by midyear population in the year 2000 with
 country code, country name, year, midyear poluation in the column output.
*/
SELECT country_code,country_name,year,midyear_population
FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex`
where year = 2000
order by midyear_population


/* query 2-  build a query to find the male and female population percentage and ordering
them year wise
*/
SELECT country_code,country_name, midyear_population,year, 
midyear_population_male/midyear_population*100 as Male_population_percentage ,
midyear_population_female/midyear_population*100 as Female_population_percentage,
FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex`
where midyear_population > 0
order by year


/* query 3- build a query to find the number of enteries with zero mid population 
*/
SELECT count(midyear_population) as zero_population,
FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex`
where midyear_population = 0


/* query 4- build a query to find the maxinum number of midyear popultion,male & female
*/
SELECT max(midyear_population) as maximum_midyear_population,
max(midyear_population_female) as maximum_midyear_female_population,
max(midyear_population_male) as maximum_midyear_Male_population,
FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex`


/* query 5- build a query to list out different countries in ascending order
*/
SELECT country_name
FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex`
group by country_name 
order by country_name


/* query 6- build a query to show top 10 highest male to female ratio
*/
SELECT midyear_population_male/midyear_population_female as male_to_female_ratio,country_name,year,
FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex`
where midyear_population_female > 0
order by male_to_female_ratio desc  
limit 10


--QUERRIES USING JOINS--

/* Query 7- write a query to find the top 10 COUNTRY with highest population before 2020 with 
their repective year infant mortality, life expectancy rates using joins.
*/
SELECT B.year,B.country_code,B.country_name,B.infant_mortality,B.life_expectancy,A.midyear_population,
 FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex` A
join `bigquery-public-data.census_bureau_international.mortality_life_expectancy` B
on A.year= B.year
order by midyear_population desc 
 LIMIT 10


/* Query 8- Build a query to find out years after 2000 in which female infant mortality
 is more than male infant mortality in Luxembourg
*/
SELECT B.year,B.country_code,B.country_name,B.infant_mortality_female,B.infant_mortality_male,
A.midyear_population_male,A.midyear_population_female,
 FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex` A
join `bigquery-public-data.census_bureau_international.mortality_life_expectancy` B
on A.year= B.year
where infant_mortality_female > infant_mortality_male and B.country_name = 'Luxembourg'and b.year >2000
LIMIT 10


/* Query 9- Build a query to find top 10 different countries with highest population 
with country code, infant mortality, life expectancy
*/
SELECT DISTINCT B.country_name, B.year,B.country_code,B.infant_mortality,B.life_expectancy,A.midyear_population,
 FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex` A
join `bigquery-public-data.census_bureau_international.mortality_life_expectancy` B
on A.year= B.year
order by midyear_population desc 
 LIMIT 10
 
 
 /* Query 10- Build a query to count the rows with zero value in midyear population,
infant mortality and life expectancy
*/
SELECT count(*) as rows_with_zero_value
 FROM `bigquery-public-data.census_bureau_international.midyear_population_5yr_age_sex` A
join `bigquery-public-data.census_bureau_international.mortality_life_expectancy` B
on A.year= B.year
where A.midyear_population =0 and B.infant_mortality = 0 and B.life_expectancy = 0
 
 
 
