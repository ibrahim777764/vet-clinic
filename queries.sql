/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';
SELECT * from animals WHERE name like '%mon%';
SELECT * from animals WHERE DATE_OF_BIRTH between '2016-01-01' and '2019-01-01'; 
SELECT * from animals WHERE NEUTERED = true and ESCAPE_ATTEMPTS < 3;
SELECT DATE_OF_BIRTH from animals WHERE name =  'Pikachu'  or name ='Agumon';
SELECT name , ESCAPE_ATTEMPTS from animals where WEIGHT_KG > 10.5;
SELECT * from animals WHERE NEUTERED = true;
SELECT * from animals where name !='Gabumon';
SELECT * from animalS where WEIGHT_KG >= 10.4 and WEIGHT_KG <= 17.3;


/*Queries that provide answers to the questions from second day tutorials.*/
-- First transaction
 begin;
 update animals set species='digimon' where name like '%mon';
 update animals set species='pokemon' where name not like '%mon';
  
-- Second transaction
 begin;
 delete from animals; -- delete all rows from table
 rollback; -- rollback all deleted rows

-- Third transaction
begin;
delete from animals where date_of_birth> '2022-01-01';
savepoint del1;
update animals set weight_kg= weight_kg*-1;
rollback to del1;
update animals set weight_kg= weight_kg*-1 where weight_kg<0;
commit;

-- other queries
select count(*) from animals;
select count(escape_attempts) from animals where escape_attempts=0;
select avg(weight_kg) from animals;
select neutered , sum(escape_attempts) from animals group by neutered;
select species, max(weight_kg),min(weight_kg) from animals group by species;
select species , avg(escape_attempts) from animals  where date_of_birth between '1990-01-01' and '2000-01-01' group by species;
