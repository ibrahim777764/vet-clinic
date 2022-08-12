/* Database schema to keep the structure of entire database. */

CREATE TABLE animals
( ID INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY, 
name VARCHAR(100),
 DATE_OF_BIRTH DATE, 
 ESCAPE_ATTEMPTS INT, 
 WEIGHT_KG DECIMAL,
 NEUTERED BOOLEAN ); 
 SPECIES VARCHAR(100)
 );

 create table owners(
ID INT GENERATED ALWAYS AS IDENTITY,
full_name VARCHAR(100),
age INT,
PRIMARY key(ID)
);

create table species(
ID INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(100),
PRIMARY key(ID)
);

alter table animals drop column species; 
alter table animals add column species_id INT ;
alter table animals add constraint constraint_fk foreign key (species_id) references species(ID) on delete cascade; 
alter table animals add column owner_id INT ;
alter table animals add constraint constraint_ownerid foreign key (owner_id) references owners(ID) on delete cascade;

-- Create a table named vets
CREATE TABLE vets (
    id            INT GENERATED ALWAYS AS IDENTITY,
    name          VARCHAR(100),
    age           INT,
    date_of_graduation DATE,
    PRIMARY KEY(id)
);

-- Create a join table named specializations
CREATE TABLE specializations (
    vets_id        INT,
    species_id     INT, 
    PRIMARY KEY(vets_id, species_id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id),
    CONSTRAINT fk_species FOREIGN KEY(species_id) REFERENCES species(id)
);


-- Create a join table named visits
CREATE TABLE visits (
    animals_id    INT,
    vets_id       INT,
    date_of_visit DATE, 
    PRIMARY KEY(animals_id, vets_id, date_of_visit),
    CONSTRAINT fk_animals FOREIGN KEY(animals_id) REFERENCES animals(id),
    CONSTRAINT fk_vets FOREIGN KEY(vets_id) REFERENCES vets(id)
);