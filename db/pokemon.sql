DROP TABLE Trainers;
DROP TABLE Pokemons;
DROP TABLE OwnedPokemons;

CREATE TABLE Trainers (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE Pokemons (
  id serial4 primary key,
  name VARCHAR(255)
);

CREATE TABLE OwnedPokemons (
  id serial4 primary key,
  pokemon_id int4 references pokemons(id),
  trainer_id int4 references trainers(id)
); 