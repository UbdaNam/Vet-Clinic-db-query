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