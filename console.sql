/*create schema movies;*/



drop table if exists movie_cast;
drop table if exists movie_genres;
drop table if exists movie_direction;
drop table if exists rating;

drop table if exists actor;
drop table if exists director;
drop table if exists genres;
drop table if exists movie;
drop table if exists reviewer;

create table actor
(
    act_id     INTEGER auto_increment,
    act_fname  char(20) null,
    act_lname  char(20) null,
    act_gender char     null,
    constraint actor_pk
        primary key (act_id)
);

create table director
(
    dir_id    INTEGER auto_increment,
    dir_fname char(20) null,
    dir_lname char(20) null,
    constraint director_pk
        primary key (dir_id)
);



create table genres
(
    gen_id    integer auto_increment,
    gen_title char(20) null,
    constraint genres_pk
        primary key (gen_id)
);


create table movie
(
    mov_id          integer auto_increment,
    mov_title       char(50) null,
    mov_year        INTEGER  null,
    mov_time        integer  null,
    mov_lang        char(50) null,
    mov_dt_rel      date     null,
    mov_rel_country char(5)  null,

    constraint movie_pk
        primary key (mov_id)
);

create table reviewer
(
    rev_id  integer auto_increment,
    rev_name char(30) null,
    constraint reviewer_pk
        primary key (rev_id)
);



create table movie_cast
(
    act_id INTEGER  null,
    mov_id INTEGER  null,
    role   char(30) null,
    constraint act_idc
        foreign key (act_id) references actor (act_id),
    constraint mov_idc1
        foreign key (act_id) references movie (mov_id)
);


create table movie_genres
(
    mov_id INTEGER null,
    gen_id INTEGER null,
    constraint gen_idc
        foreign key (gen_id) references genres (gen_id),
    constraint mov_idc2
        foreign key (mov_id) references movie (mov_id)
);

create table movie_direction
(
    dir_id integer null,
    mov_id integer null,
    constraint dir_idc
        foreign key (dir_id) references director (dir_id),
    constraint mov_idc3
        foreign key (mov_id) references movie (mov_id)
);



create table rating
(
    mov_id        integer null,
    rev_id        integer null,
    rev_stars     integer null,
    rum_o_ratings integer null,
    constraint mov_idc4
        foreign key (mov_id) references movie (mov_id),
    constraint rev_idc
        foreign key (rev_id) references reviewer (rev_id)
);

insert into actor (act_fname, act_lname, act_gender)
values ('johnnny', 'Depp', 'M'),
       ('Al', 'Pacino', 'M'),
       ('Robert', 'De Niro', 'M'),
       ('Angelina', 'Jolie', 'F'),
       ('Kate', 'Winslet', 'F'),
       ('Morgan', 'Freeman', 'M'),
       ('Charlize', 'Theron', 'F'),
       ('Will', 'Smith', 'M'),
       ('Scarlett', 'Johansson', 'F'),
       ('Woody', 'Allen', 'M'),
       ('Stanley', 'Kubrick','M');


insert into director (dir_fname, dir_lname)
values ('Stanley', 'Kubrick'),
       ('Steven', 'Spielberg'),
       ('Martin', 'Scorsese'),
       ('Ridley', 'Scott'),
       ('Tim', 'Burton'),
       ('Quentin', 'Tarantino'),
       ('James', 'Cameron'),
       ('Francis Ford', 'Coppola'),
       ('Guy', 'Rithchie'),
       ('Oliver', 'Stone');

insert into genres (gen_title)
values ('Action'),
       ('Adventure'),
       ('Comedy'),
       ('Crime'),
       ('Drama'),
       ('Fantasy'),
       ('Historical'),
       ('Historical fiction'),
       ('Horror'),
       ('Satire');

insert into movie (mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country)
VALUES ('Avatar', '2009', '120', 'English', '2010-12-1', 'UK'),
       ('Avengers: Endgame film currently playing', '2019', '122', 'English', '2020-12-1', 'UK'),
       ('Titanic', '1997', '124', 'French', '1998-12-1', 'US'),
       ('Star Wars: The Force Awakens', '2015', '126', 'Duits', '2016-12-1', 'US'),
       ('Avengers: Infinity War', '2018', '128', 'English', '2019-12-1', 'US'),
       ('Jurassic World', '2015', '130', 'English', '2016-12-1', 'GER'),
       ('The Avengers', '2012', '132', 'English', '2013-12-1', 'GER'),
       ('Furious 7', '2015', '134', 'English', '2016-12-1', 'GER'),
       ('Avengers: Age of Ultron', '2015', '136', 'English', '2016-12-1', 'GER'),
       ('Black Panther', '2018', '138', 'Italian', '2019-12-1', 'GER'),
       ('Harry Potter and the Deathly Hallows – Part 2', '2011', '140', 'English', '2012-12-1', 'ITALY'),
       ('Star Wars: The Last Jedi', '2017', '142', 'English', '2018-12-1', 'ITALY'),
       ('Jurassic World: Fallen Kingdom', '2018', '144', 'English', '2019-12-1', 'ITALY'),
       ('Frozen', '2013', '146', 'Italian', '2014-12-1', 'ITALY'),
       ('Beauty and the Beast', '2017', '148', 'English', '2018-12-1', 'ITALY'),
       ('Incredibles 2', '2018', '150', 'English', '2019-12-1', 'ITALY'),
       ('The Fate of the Furious', '2017', '152', 'English', '2018-12-1', 'FRA'),
       ('Iron Man 3', '2013', '154', 'Italian', '2014-12-1', 'FRA'),
       ('Minions', '2015', '156', 'English', '2016-12-1', 'FRA'),
       ('Captain America: Civil War', '2016', '158', 'English', '2017-12-1', 'UK'),
       ('Eyes Wide Shut', '2010', '160', 'English', '2011-12-1', 'UK'),
       ('American Beauty', '1999', '161', 'English', '2000-12-1', 'US')
;

insert into reviewer (rev_name)
values ('Henri Agel'),
       ('Laurent Aknin'),
       ('Yves Alion'),
       ('Guy Allombert'),
       ('Barthélémy Amengual'),
       ('Vincent Amiel'),
       ('Cédric Anger'),
       ('Antonin Artaud'),
       ('Olivier Assayas'),
       ('Jacques Aumont'),
       ('Jean George Auriol'),
       ('Nicolas Azalbert'),
       ('Philippe Azoury');

insert into rating (mov_id, rev_id, rev_stars, rum_o_ratings)
values
(13,4,1,2),
(7,4,9,6),
(16,7,null,null),
(2,4,7,5),
(11,9,10,3),
(11,12,0,6),
(16,4,5,3),
(16,12,2,8),
(9,4,6,3),
(18,3,6,2),
(6,9,3,10),
(8,4,5,2),
(7,3,4,2),
(11,9,2,6),
(9,9,1,5),
(11,11,3,2),
(9,8,8,5),
(6,6,3,4),
(21,4,9,9),
(21,5,3,6),
(9,6,7,5),
(10,6,2,8),
(12,4,5,3),
(16,3,9,4),
(17,1,5,2),
(14,13,3,8),
(4,7,1,3),
(12,3,6,1),
(5,10,1,7),
(22,9,0,9),
(20,11,5,6),
(6,8,1,6),
(21,11,1,9),
(4,3,8,4),
(3,11,10,8),
(5,3,0,9),
(19,8,6,6),
(1,1,6,3),
(9,13,4,5),
(14,6,2,7),
(6,6,1,8),
(16,4,9,8),
(8,8,5,6),
(14,6,3,2),
(15,12,8,2),
(4,4,7,5),
(15,5,5,9),
(10,10,4,5),
(4,11,4,6),
(3,8,8,8);

insert into movie_cast (act_id, mov_id, role) VALUES


(6,1,'first hero role'),
(8,2,'second hero role'),
(7,8,'figurant'),
(1,9,'first adversary role'),
(8,19,'second adversary role'),
(4,10,'first hero role'),
(6,15,'second hero role'),
(5,9,'figurant'),
(10,7,'first adversary role'),
(6,5,'second adversary role'),
(3,13,'first hero role'),
(5,8,'second hero role'),
(3,3,'figurant'),
(4,20,'first adversary role'),
(7,21,'second adversary role'),
(6,20,'first hero role'),
(10,17,'second hero role'),
(4,18,'figurant'),
(3,19,'first adversary role'),
(3,6,'second adversary role'),
(2,4,'first hero role'),
(8,16,'second hero role'),
(9,2,'figurant'),
(10,21,'first adversary role'),
(5,2,'second adversary role'),
(5,19,'first hero role'),
(4,13,'second hero role'),
(1,3,'figurant'),
(8,13,'first adversary role'),
(6,4,'second adversary role'),
(8,12,'first hero role'),
(7,7,'second hero role'),
(7,18,'figurant'),
(3,12,'first adversary role'),
(2,20,'second adversary role'),
(3,13,'first hero role'),
(10,12,'second hero role'),
(2,19,'figurant'),
(5,13,'first adversary role'),
(5,13,'second adversary role'),
(6,17,'first hero role'),
(5,17,'second hero role'),
(10,12,'figurant'),
(8,10,'first adversary role'),
(9,13,'second adversary role'),
(10,14,'first hero role'),
(6,10,'second hero role'),
(8,11,'figurant'),
(8,11,'first adversary role'),
(6,10,'second adversary role'),
(11,21,'figurant');

insert into movie_direction (dir_id, mov_id) VALUES
(2,1),
(7,2),
(6,3),
(9,4),
(9,5),
(6,6),
(9,7),
(9,8),
(8,9),
(9,10),
(4,11),
(4,12),
(10,13),
(1,14),
(2,15),
(8,16),
(2,17),
(5,18),
(1,19),
(8,20),
(1,21),
(7,22);


insert into movie_genres (mov_id, gen_id) VALUES
(21,2),
(19,4),
(21,10),
(20,3),
(14,5),
(5,9),
(15,7),
(13,7),
(9,10),
(17,8),
(7,8),
(12,5),
(17,3),
(20,8),
(3,7),
(16,4),
(10,9),
(21,7),
(5,8),
(12,1),
(6,4),
(20,6),
(19,7),
(15,3),
(16,6),
(6,6),
(12,3),
(4,3),
(6,5),
(20,9),
(8,8),
(15,8),
(2,6),
(4,2),
(10,2),
(5,5),
(14,8),
(3,1),
(18,9),
(6,1),
(2,1),
(12,4),
(3,4),
(16,5),
(7,6);



/*---------------------------------------------------*/
/* opdrachten */

/* Vraag 1*/
select mov_title, mov_year
from movie;

/* Vraag 2*/
select  mov_year
from movie
where mov_title ='American Beauty'
;

/* Vraag 3*/
select  mov_title
from movie
where mov_year =1999
;

/* Vraag 4*/
select  mov_title
from movie
where mov_year <1999
;

/* Vraag 5*/
select  mov_title, rev_name
from movie
    join rating on movie.mov_id = rating.mov_id
join reviewer r on rating.rev_id = r.rev_id;


/* Vraag 6*/
select distinct  rev_name
from reviewer
    join rating r on reviewer.rev_id = r.rev_id
where rev_stars >7;

/* Vraag 7*/
select distinct  mov_title
from movie
    join rating on movie.mov_id = rating.mov_id
where rev_stars is null;


/* Vraag 8 */
select distinct mov_id, mov_title
from movie
where mov_id in (5,7,9);

/* Vraag 9 */
select distinct act_fname, act_lname
from actor
where act_fname like 'Woody' and act_lname like 'Allen';

/* Vraag 10
select distinct dir_fname, dir_lname
from director;
select
from movie
*/

/* Vraag 11 */
select  mov_title from movie
where mov_rel_country  not like 'UK';

/* Vraag 12 */

select distinct mov_year from movie
join rating r on movie.mov_id = r.mov_id
where rev_stars>3
order by mov_year asc;

/* Vraag 13 */


/* Vraag 16 */

select distinct   act_fname, act_lname, mov_year from actor
join movie_cast mc on actor.act_id = mc.act_id
join movie m on mc.act_id = m.mov_id
where mov_year not between 1990 and 2000;
;

/* Vraag 17 */

select dir_fname, dir_lname,  count(gen_title) as genreNbr from director
join movie_direction md on director.dir_id = md.dir_id
join movie m on md.mov_id = m.mov_id
join movie_genres mg on m.mov_id = mg.mov_id
join genres g on mg.gen_id = g.gen_id
group by dir_lname
;



/* Vraag 18 */

select mov_title, mov_year,gen_title  from  movie m
join movie_genres mg on m.mov_id = mg.mov_id
join genres g on mg.gen_id = g.gen_id
order by mov_title
;

/* Vraag 19 */

select mov_title, mov_year,gen_title  from  movie m
join movie_genres mg on m.mov_id = mg.mov_id
join genres g on mg.gen_id = g.gen_id
order by mov_title
;
