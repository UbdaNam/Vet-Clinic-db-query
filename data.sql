/* Populate database with sample data. */

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Agumon', TO_DATE('03/02/2020','DD/MM/YYYY'), 10.23, '1', 0),
('Gabumon', TO_DATE('15/11/2018','DD/MM/YYYY'), 8, '1', 2),
('Pikachu', TO_DATE('07/01/2021','DD/MM/YYYY'), 15.04, '0', 1),
('Devimon', TO_DATE('12/05/2017','DD/MM/YYYY'), 11, '1', 5);

INSERT INTO animals (name, date_of_birth, weight_kg, neutered, escape_attempts) 
VALUES ('Charmander', TO_DATE('08/02/2020','DD/MM/YYYY'), 11, '0', 0),
('Plantmon', TO_DATE('15/11/2021','DD/MM/YYYY'), 5.7, '1', 2),
('Squirtle', TO_DATE('02/04/1993','DD/MM/YYYY'), 12.13, '0', 3),
('Angemon', TO_DATE('12/06/2005','DD/MM/YYYY'), 45, '1', 1),
('Boarmon', TO_DATE('07/06/2005','DD/MM/YYYY'), 20.4, '1', 7),
('Blossom', TO_DATE('13/10/1998','DD/MM/YYYY'), 17, '1', 3),
('Ditto', TO_DATE('14/05/2022','DD/MM/YYYY'), 22, '1', 4);

INSERT INTO owners(full_name, age) VALUES
('Sam Smith', 34),
('Jennifer Orwell', 19),
('Bob', 45),
('Melody Pond', 77),
('Dean Winchester', 14),
('Jodie Whittaker', 38);

INSERT INTO species (name) VALUES('Pokemon'),('Digimon');

UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Digimon') WHERE name LIKE '%mon';
UPDATE animals SET species_id = (SELECT id FROM species WHERE name='Pokemon') WHERE species_id IS NULL;
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Sam Smith') WHERE name='Agumon';
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Jennifer Orwell') WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Bob') WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Melody Pond') WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name='Dean Winchester') WHERE name IN ('Angemon', 'Boarmon');

INSERT INTO vets(name, age, date_of_graduation) VALUES
('William Tatcher', 45, TO_DATE('23/04/2000','DD/MM/YYYY')),
('Maisy Smith', 26, TO_DATE('17/01/2019','DD/MM/YYYY')),
('Stephanie Mendez', 64, TO_DATE('04/05/1981','DD/MM/YYYY')),
('Jack Harkness', 38, TO_DATE('08/06/2008','DD/MM/YYYY'));

INSERT INTO specializations(vet_id, species_id) VALUES 
((SELECT id FROM vets WHERE name='William Tatcher'), (SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name='Stephanie Mendez'), (SELECT id FROM species WHERE name='Pokemon')),
((SELECT id FROM vets WHERE name='Stephanie Mendez'), (SELECT id FROM species WHERE name ='Digimon')),
((SELECT id FROM vets WHERE name='Jack Harkness'), (SELECT id FROM species WHERE name='Digimon'));

INSERT INTO visits(animal_id, vet_id, date_of_visit) VALUES 
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='William Tatcher'), TO_DATE('24/05/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), TO_DATE('22/07/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Gabumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), TO_DATE('02/02/2021','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('05/01/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('08/03/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Pikachu'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('14/05/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Devimon'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), TO_DATE('04/05/2021','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Charmander'), (SELECT id FROM vets WHERE name='Jack Harkness'), TO_DATE('24/02/2021','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('21/12/2019','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='William Tatcher'), TO_DATE('10/08/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Plantmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('07/04/2021','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Squirtle'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), TO_DATE('29/09/2019','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), TO_DATE('03/10/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Agumon'), (SELECT id FROM vets WHERE name='Jack Harkness'), TO_DATE('04/11/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('24/01/2019','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('15/05/2019','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('27/02/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Boarmon'), (SELECT id FROM vets WHERE name='Maisy Smith'), TO_DATE('03/08/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='Stephanie Mendez'), TO_DATE('24/05/2020','DD/MM/YYYY')),
((SELECT id FROM animals WHERE name='Blossom'), (SELECT id FROM vets WHERE name='William Tatcher'), TO_DATE('11/01/2021','DD/MM/YYYY'));


INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';