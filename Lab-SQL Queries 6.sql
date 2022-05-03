use sakila;

drop table if exists films_2020;
CREATE TABLE `films_2020` (
  `film_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` year(4) DEFAULT NULL,
  `language_id` tinyint(3) unsigned NOT NULL,
  `original_language_id` tinyint(3) unsigned DEFAULT NULL,
  `rental_duration` int(6),
  `rental_rate` decimal(4,2),
  `length` smallint(5) unsigned DEFAULT NULL,
  `replacement_cost` decimal(5,2) DEFAULT NULL,
  `rating` enum('G','PG','PG-13','R','NC-17') DEFAULT NULL,
  PRIMARY KEY (`film_id`),
  CONSTRAINT FOREIGN KEY (`original_language_id`) REFERENCES `language` (`language_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8;

-- Add the new films to the database.
-- right click in the films_2020 in the interface of navigator > Table Data Import Wizard > browse the csv file from the lab, 
-- in my case I used the path C:\Users\Admin\IH-Labs\lab-sql-6\files_for_lab\films_2020.csv and 
-- by clicking next till finish I added the new films to the database
-- or
/* we can add new films in the database with the following commands
 LOAD DATA INFILE 'C:\Users\Admin\IH-Labs\lab-sql-6\files_for_lab\films_2020.csv' 
INTO TABLE sakila.films_2020
FIELDS TERMINATED BY ',';
-- the first time I ran I got an error, had to change some settings:
-- Step 1
show variables like 'local_infile';
set global local_infile = 1;
-- Step 2
show variables like 'secure_file_priv'; -- this gives you the path you need to save the .csv to
-- Step 3
set sql_safe_updates = 0;*/
select * from  sakila.films_2020;
select count(film_id) from  sakila.films_2020;

-- Update information on rental_duration, rental_rate, and replacement_cost.
update sakila.films_2020
set rental_duration=3
where rental_duration=0;

update sakila.films_2020 
set rental_rate='2.99';

update sakila.films_2020
set replacement_cost='8.99'
where replacement_cost=0.00;

select * from  sakila.films_2020;

