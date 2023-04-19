DROP TABLE IF EXISTS athletes;
CREATE TABLE athletes(
        id serial PRIMARY KEY,
        firstName VARCHAR(255),
        lastName VARCHAR(255),
        club VARCHAR(255),
        learnedskills integer ARRAY,
        intrainingskills integer ARRAY,
        futureskills integer ARRAY
);