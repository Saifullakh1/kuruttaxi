postgres=# CREATE DATABASE KurutTaxi;
CREATE DATABASE

postgres=# \c kuruttaxi;
You are now connected to database "kuruttaxi" as user "postgres".

#1

kuruttaxi=# CREATE TABLE cars (
id bigint PRIMARY KEY GENERATED ALWAYS AS IDENTITY,  marka varchar(20),
model varchar(20),
oil_type varchar (20),
volume varchar(20),
transmission_type varchar(20),
release date,
color varchar(10));
CREATE TABLE

CREATE TABLE drivers(
id bigint PRIMARY KEY,
first_name varchar(20),
last_name varchar(20),
birthday date,
experience integer,
gender varchar(8),
cars_id bigint REFERENCES cars(id));
CREATE TABLE

CREATE TABLE operator(
name varchar(25),
last_name varchar(30),
birthday date,
gender varchar(8));
CREATE TABLE


#2

SELECT * FROM cars;
 id |   marka    |  model  | oil_type | volume  | transmission_type |  release   | color  
----+------------+---------+----------+---------+-------------------+------------+--------
  1 | BMW        | M5      | petrol   | 450 lit | meahnika          | 2018-12-08 | black
  2 | Mers       | E500    | petrol   | 340 lit | meahnika          | 2020-02-20 | black
  3 | Toyota     | Camry   | petrol   | 120 lit | avtomat           | 2014-01-24 | silver
  4 | Lexus      | E350    | petrol   | 200 lit | avtomat           | 2016-01-01 | white
  5 | Huinday    | Solaris | petrol   | 50 lit  | meahnika          | 2018-04-15 | white
  6 | Daewoo     | Matiz   | petrol   | 7 lit   | meahnika          | 2004-04-15 | white
  7 | Volkswagen | Golf    | electric | 12KW    | meahnika          | 2021-04-15 | silver
  8 | Tesla      | Suv     | electric | 15KW    | meahnika          | 2021-01-21 | red
  9 | Honda      | Fit     | petrol   | 15 lit  | avtomat           | 2008-11-06 | silver
 10 | Honda      | Stream  | petrol   | 20 lit  | avtomat           | 2006-11-06 | white
(10 rows)



SELECT * FROM drivers;
 id | first_name | last_name |  birthday  | experience | gender | cars_id 
----+------------+-----------+------------+------------+--------+---------
  1 | Maksat     | Osmonov   | 2002-02-14 |         10 | male   |        
  2 | Ishak      | Avipov    | 2002-02-23 |          5 | male   |        
  3 | Erlan      | Abidinov  | 2002-07-28 |          3 | male   |        
  4 | Artur      | Nuranov   | 2004-02-01 |          1 | male   |        
  5 | Alina      | Aidarova  | 2002-08-09 |          1 | female |        
  6 | Elena      | Smirnova  | 2000-08-10 |          4 | female |        
  7 | Diana      | Ulanova   | 1998-12-31 |          2 | female |        
  8 | Nurbek     | Usonov    | 1996-08-31 |          8 | male   |        
  9 | Asan       | Usonov    | 1991-08-31 |         13 | male   |        
 10 | Azamat     | Azamatov  | 1993-11-14 |          7 | male   |        
(10 rows)




SELECT * FROM operator;
   name   |   last_name   |  birthday  | gender 
----------+---------------+------------+--------
 Temirlan | Aldyrakov     | 2003-05-06 | male
 Aylira   | Karbekova     | 2002-05-11 | female
 Aizirek  | Kursanova     | 2002-10-11 | female
 Meerim   | Attokurova    | 2002-08-16 | female
 Ibrahim  | Azizbekov     | 2003-07-23 | male
 Ulan     | Mamatov       | 2002-06-28 | male
 Ainura   | Ulanova       | 1998-12-11 | female
 Ainazik  | Usonova       | 2002-03-31 | female
 Ulan     | Kubanychbekov | 2002-04-22 | male
 Islam    | Azatov        | 2000-07-23 | male
(10 rows)



#3

SELECT * FROM cars WHERE marka = 'Toyota' AND model = 'Camry' ORDER BY release DESC;
 id | marka  | model | oil_type | volume  | transmission_type |  release   | color  
----+--------+-------+----------+---------+-------------------+------------+--------
  3 | Toyota | Camry | petrol   | 120 lit | avtomat           | 2014-01-24 | silver
  6 | Toyota | Camry | petrol   | 7 lit   | meahnika          | 2004-04-15 | white
(2 rows)


#4

SELECT DISTINCT name FROM operator ORDER BY name DESC LIMIT 10;
   name   
----------
 Ulan
 Temirlan
 Meerim
 Islam
 Ibrahim
 Aylira
 Aizirek
 Ainura
 Ainazik
(9 rows)

#5
UPDATE cars SET marka = 'Mersus' WHERE marka = 'Mercedes';
 id |   marka    |  model  | oil_type | volume  | transmission_type |  release   | color  
----+------------+---------+----------+---------+-------------------+------------+--------
  1 | BMW        | M5      | petrol   | 450 lit | meahnika          | 2018-12-08 | black
  3 | Toyota     | Camry   | petrol   | 120 lit | avtomat           | 2014-01-24 | silver
  4 | Lexus      | E350    | petrol   | 200 lit | avtomat           | 2016-01-01 | white
  7 | Volkswagen | Golf    | electric | 12KW    | meahnika          | 2021-04-15 | silver
  8 | Tesla      | Suv     | electric | 15KW    | meahnika          | 2021-01-21 | red
  9 | Honda      | Fit     | petrol   | 15 lit  | avtomat           | 2008-11-06 | silver
 10 | Honda      | Stream  | petrol   | 20 lit  | avtomat           | 2006-11-06 | white
  6 | Toyota     | Camry   | petrol   | 7 lit   | meahnika          | 2004-04-15 | white
  2 | Mersus     | E500    | petrol   | 340 lit | meahnika          | 2020-02-20 | black
  5 | Mersus     | S-class | petrol   | 50 lit  | meahnika          | 2018-04-15 | white
(10 rows)


#6
DELETE FROM drivers WHERE first_name = 'Azamat' AND last_name = 'Azamatov';

 id | first_name | last_name |  birthday  | experience | gender | cars_id 
----+------------+-----------+------------+------------+--------+---------
  1 | Maksat     | Osmonov   | 2002-02-14 |         10 | male   |        
  2 | Ishak      | Avipov    | 2002-02-23 |          5 | male   |        
  3 | Erlan      | Abidinov  | 2002-07-28 |          3 | male   |        
  4 | Artur      | Nuranov   | 2004-02-01 |          1 | male   |        
  5 | Alina      | Aidarova  | 2002-08-09 |          1 | female |        
  6 | Elena      | Smirnova  | 2000-08-10 |          4 | female |        
  7 | Diana      | Ulanova   | 1998-12-31 |          2 | female |        
  8 | Nurbek     | Usonov    | 1996-08-31 |          8 | male   |        
  9 | Maksat     | Azamatov  | 1991-08-31 |         13 | male   |        
(9 rows)


#7

SELECT COUNT(*) FROM drivers WHERE experience > 10 AND gender = 'female';
 count 
-------
     2
(1 row)

#8

SELECT AVG(experience) FROM drivers WHERE birthday < '2002-07-28';
        avg         
--------------------
 9.1666666666666667
(1 row)


