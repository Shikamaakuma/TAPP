DROP TABLE IF EXISTS progress;
CREATE TABLE progress(
                         skill_id int8,
                         athlete_id int8,
                         type varchar,
                         comment text,
                         score int,
                         PRIMARY KEY (skill_id, athlete_id)
);