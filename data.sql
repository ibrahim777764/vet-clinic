/* Populate database with sample data. */

INSERT INTO animals (name,DATE_OF_BIRTH,ESCAPE_ATTEMPTS,WEIGHT_KG,NEUTERED)
values
('Agumon','2020-02-03',0,10.23,true),
 ('Gabumon','2018-11-15',2,8,true), 
 ('Pikachu','2021-01-07',1,15.04,false), 
('devimon','2017-05-12',5,11,true),
('Charmander','2020-03-08',0,11,false),
('Plantmon' , '2021-11-15',2,5.7,true),
('Squirtle','1993-04-02',3,12.13,false),
('Angemon','2005-06-12',1,45,true),
('Boarmon','2005-06-07',7,20.4,true),
('Blossom','1998,10-13',3,17,true),
('Ditto','2022-05-14',4,22,true);

insert into owners (full_name,age) values 
('Sam Smith',34),
('Jennifer Orwell',19),
('Bob',45),
('Melody Pond',77),
('Dean Winchester',14),
('Jodie Whittaker',38)
;

insert into species (name) values 
('Pokemon'),
('Digimon')
;
-- update animals table
update animals set species_id='1' where name not like '%mon';
update animals set species_id='2' where name like '%mon';

update animals set owner_id=1  where name='Agumon';
update animals set owner_id=2  where name='Gabumon' or name='Pikachu';
update animals set owner_id=3  where name='devimon' or name='Plantmon';  
update animals set owner_id=4  where name='Charmander' or name='Squirtle' or name='Blossom';
update animals set owner_id=5  where name='Angemon' or name='Boarmon'; 