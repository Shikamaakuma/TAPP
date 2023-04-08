DROP TABLE IF EXISTS skills;
CREATE TABLE skills(
        id serial PRIMARY KEY,
        name VARCHAR(255),
        description TEXT,
        related_skills integer ARRAY
);