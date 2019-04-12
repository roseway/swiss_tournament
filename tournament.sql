-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

DROP DATABASE IF EXISTS tournament;
CREATE DATABASE tournament;

\c tournament


create table players (
	id serial primary key, 
	name text
	);


create table matches (
	match_id serial primary key, 
	winner integer references players(id), 
	loser integer references players(id)
	);

 CREATE VIEW nummatches AS 
 SELECT p.id, p.name, COUNT(*) AS matches 
 FROM players p, matches m 
 WHERE p.id=m.winner or p.id=m.loser 
 GROUP BY p.id; 
