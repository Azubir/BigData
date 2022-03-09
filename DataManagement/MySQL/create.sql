create database sport;

use sport;

create table players(surname varchar(60) not null, team varchar(60) not null, position varchar(60) not null, minutes smallint not null, shots varchar(60) not null, passes varchar(60) not null, tackles varchar(60) not null, saves varchar(60) not null, primary key(surname, team, position));

create table teams(team varchar(60) not null, ranking smallint null, games smallint not null, wins smallint not null, draws smallint not null, losses smallint not null, goalsFor smallint not null, goalsAgainst smallint not null, yellowCards smallint not null, redCards smallint not null, primary key(team));

