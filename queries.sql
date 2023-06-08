/*Queries that provide answers to the questions from all projects.*/

 SELECT * from animals WHERE name LIKE '%mon';
 SELECT * FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 and 2019;
 SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
 SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
 SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
 SELECT * FROM animals WHERE neutered = '1';
 SELECT * FROM animals WHERE NOT (name = 'Gabumon');
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;