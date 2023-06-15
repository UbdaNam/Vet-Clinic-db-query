/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(35) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BIT NOT NULL,
  weight_kg FLOAT NOT NULL
);

ALTER TABLE animals ADD species VARCHAR(35);

CREATE TABLE owners (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  full_name VARCHAR(40) NOT NULL,
  age INT
);

CREATE TABLE species (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(40) NOT NULL
);
 
 ALTER TABLE animals DROP species;

 ALTER TABLE animals ADD COLUMN species_id INT REFERENCES species(id);
 ALTER TABLE animals ADD COLUMN owner_id INT REFERENCES owners(id);

 CREATE TABLE vets (
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(40) NOT NULL,
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INT REFERENCES vets(id),
  species_id INT REFERENCES species(id),
  PRIMARY KEY(vet_id, species_id)
);

CREATE TABLE visits (
  id INT SERIAL PRIMARY KEY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE NOT NULL,
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);


CREATE INDEX VISITS_ANIMAL_ID_ASC ON VISITS(ANIMAL_ID ASC);

CREATE INDEX VET_ID_ASC ON VISITS(VET_ID, ID, ANIMAL_ID, DATE_OF_VISIT);

CREATE INDEX OWNERS_EMAIL_ASC ON OWNERS(EMAIL ASC);