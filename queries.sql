/*Queries that provide answers to the questions from all projects.*/

 SELECT * from animals WHERE name LIKE '%mon';
 SELECT * FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 and 2019;
 SELECT name FROM animals WHERE neutered = '1' AND escape_attempts < 3;
 SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
 SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
 SELECT * FROM animals WHERE neutered = '1';
 SELECT * FROM animals WHERE NOT (name = 'Gabumon');
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;

 BEGIN;
 UPDATE animals SET species='unspecified';
 SELECT * FROM animals;
 ROLLBACK;
 SELECT * FROM animals;

 BEGIN;
 UPDATE animals SET species='digimon' WHERE name LIKE '%mon';
 UPDATE animals SET species='pokemon' WHERE species IS NULL;
 SELECT * FROM animals;
 COMMIT;
 SELECT * FROM animals;

 BEGIN;
 DELETE FROM animals;
 ROLLBACK;
 SELECT * FROM animals;

 BEGIN;
 DELETE FROM animals WHERE date_of_birth > '2022-01-01';
 SAVEPOINT SP1;
 UPDATE animals SET weight_kg=weight_kg*-1;
 UPDATE animals SET weight_kg=weight_kg*-1 WHERE weight_kg < 0;
 SELECT * FROM animals,
 COMMIT;
 
 SELECT COUNT(*) FROM animals;
 SELECT COUNT(*) FROM animals WHERE escape_attempts=0;
 SELECT AVG(weight_kg) FROM animals;
 SELECT neutered, COUNT(*) FROM animals WHERE escape_attempts > -1 GROUP BY neutered;
 SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
 SELECT AVG(escape_attempts) FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 1990 AND 2000 GROUP BY species;

 SELECT o.full_name,a.name FROM animals AS a INNER JOIN owners AS o ON a.owner_id = o.id WHERE o.full_name='Melody Pond';
 SELECT a.name FROM animals AS a INNER JOIN species AS s ON a.species_id = s.id WHERE s.name='Pokemon';
 SELECT o.full_name, a.name FROM animals AS a RIGHT JOIN owners AS o ON a.owner_id = o.id;
 SELECT s.name, COUNT(a.name) FROM animals AS a INNER JOIN species AS s ON a.species_id = s.id GROUP BY s.name;
 SELECT o.full_name,a.name FROM animals AS a INNER JOIN owners AS o ON a.owner_id = o.id INNER JOIN species AS s ON a.species_id = s.id WHERE o.full_name='Jennifer Orwell' AND s.name='Digimon';
 SELECT o.full_name,a.name FROM animals AS a INNER JOIN owners AS o ON a.owner_id = o.id WHERE o.full_name='Dean Winchester' AND a.escape_attempts=0;
 SELECT o.full_name, COUNT(a.name) as num_of_animals FROM animals AS a INNER JOIN owners AS o ON a.owner_id = o.id GROUP BY o.full_name ORDER BY num_of_animals DESC LIMIT 1;

 SELECT a.name FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN vets AS vt ON v.vet_id=vt.id WHERE vt.name='William Tatcher' ORDER BY v.date_of_visit DESC LIMIT 1;
 SELECT COUNT(a.name) FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN vets AS vt ON v.vet_id=vt.id WHERE vt.name='Stephanie Mendez';
 SELECT v.name, s.name FROM vets AS v LEFT JOIN specializations AS sp ON v.id=sp.vet_id LEFT JOIN species AS s ON sp.species_id=s.id ORDER BY v.name;
 SELECT a.name, v.date_of_visit FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN vets AS vt ON v.vet_id=vt.id WHERE vt.name='Stephanie Mendez' AND v.date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';
 SELECT a.name, COUNT(*) AS number_of_visits FROM visits AS v JOIN animals AS a ON v.animal_id=a.id GROUP BY a.name ORDER BY number_of_visits DESC LIMIT 1;
 SELECT a.name FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN vets AS vt ON v.vet_id=vt.id WHERE vt.name='Maisy Smith' ORDER BY v.date_of_visit LIMIT 1;
 SELECT a.name, vt.name, v.date_of_visit FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN vets AS vt ON v.vet_id=vt.id WHERE v.date_of_visit=(SELECT MAX(date_of_visit) FROM visits) LIMIT 1;
 SELECT COUNT(*) FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN vets AS vt ON v.vet_id=vt.id LEFT JOIN specializations AS sp ON vt.id=sp.vet_id AND a.species_id = sp.species_id WHERE sp.vet_id <> sp.species_id;
 SELECT s.name FROM visits AS v JOIN animals AS a ON v.animal_id=a.id JOIN species AS s ON a.species_id=s.id WHERE v.vet_id=(SELECT id FROM vets WHERE name='Maisy Smith') GROUP BY s.name ORDER BY COUNT(*) DESC LIMIT 1;