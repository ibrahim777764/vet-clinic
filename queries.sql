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

/*Queries that provide answers to the questions from third day tutorials.*/
select full_name, name from owners join animals on animals.owner_id= owners.id where full_name='Melody Pond';
select animals.name from animals join species on animals.species_id= species.id where species.name='Pokemon';
select full_name, count(name) from owners left join animals on animals.owner_id= owners.id; 
select animals.name from owners join animals on animals.owner_id= owners.id where owners.full_name='Jennifer Orwell' and animals.species_id=2;
select animals.name from owners join animals on animals.owner_id= owners.id where owners.full_name='Dean Winchester' and animals.escape_attempts=0;
select species.name, count(animals.name) from species join animals on animals.species_id= species.id group by species.name;


-- Who was the last animal seen by William Tatcher?
SELECT animals.name 
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'William Tatcher'
  ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see?
SELECT COUNT(DISTINCT animals.name)
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez';


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name AS vet,species.name AS specialization
  FROM vets
  JOIN  specializations ON  vets.id = vets_id 
  JOIN species ON species_id = species.id;


-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.name
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' 
  AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';



-- What animal has the most visits to vets?
SELECT animals.name, count(*)
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id 
  GROUP BY animals.name ORDER BY count DESC LIMIT 1;


-- Who was Maisy Smith's first visit?
SELECT animals.name,date_of_visit
  FROM animals
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON vets_id = vets.id WHERE vets.name = 'Maisy Smith' 
  ORDER BY date_of_visit LIMIT 1;


-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.name,date_of_birth,escape_attempts,neutered,weight_kg,species.name as specie,
      vets.name as vet_name,vets.age as vet_age,date_of_graduation ,date_of_visit
  FROM species 
  JOIN animals ON animals.species_id = species.id
  JOIN  visits ON  animals.id = animals_id 
  JOIN vets ON visits.vets_id = vets.id
  ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
  SELECT vets.name,count(*) 
    FROM visits
    JOIN  vets ON vets.id = visits.vets_id  
    LEFT JOIN specializations ON vets.id = specializations.vets_id WHERE specializations.vets_id IS NULL
    GROUP BY vets.name;
    
-- What specialty should Maisy Smith consider getting? Look for the species she gets the most.
  SELECT species.name AS specialization,count(*) AS number_of_visits
    FROM species
    JOIN  animals ON species.id = animals.species_id
    JOIN visits ON animals.id  = visits.animals_id
    JOIN vets ON visits.vets_id = vets.id  WHERE vets.name = 'Maisy Smith'
    GROUP BY species.name ORDER BY number_of_visits DESC LIMIT 1;