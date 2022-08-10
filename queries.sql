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

