# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS skills, people, peopleskills, roles, peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (

    id              INT          NOT NULL,
    name            VARCHAR(255) NOT NULL,
    description     VARCHAR(255) NOT NULL,
    tag             VARCHAR(255) NOT NULL,
    url             VARCHAR(255) DEFAULT NULL,
    time_commitment INT          DEFAULT NULL,

    PRIMARY KEY (id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment)
VALUES
(
    1,
    "Front-End Development",
    "Design and preparation of client-facing side of server",
    "Skill 1",
    "https://react.dev/",
    50
),
(
    2,
    "Back-End Development",
    "Implementation of server-side services and security",
    "Skill 2",
    "https://nodejs.org/en/",
    60
),
(
    3,
    "Command Line",
    "Use of Unix shell software for interacting with machine",
    "Skill 3",
    "https://ubuntu.com/tutorials/command-line-for-beginners/",
    100
),
(
    4,
    "Databases",
    "Familiarity with DBMS, relational-tables, and queries",
    "Skill 4",
    "https://cmsc508.com/",
    25
),
(
    5,
    "Algorithms",
    "Development and analysis of algorithms and their complexities",
    "Skill 5",
    "https://leetcode.com/",
    100
),
(
    6,
    "Object-Oriented Programming",
    "Programming paradigm in which conglomerations of smaller pieces of data are represented by larger data-objects",
    "Skill 6",
    "https://www.codecademy.com/",
    60
),
(
    7,
    "Functional Programming",
    "Programming paradigm under which all programs are treated as functions that evaluate independetly of state",
    "Skill 7",
    "https://lisp-lang.org/",
    70
),
(
    8,
    "Troubleshooting",
    "Identifying and resolving both runtime and logical errors in code, as well as any kind of unintended behaviors",
    "Skill 8",
    "https://www.sourceware.org/gdb/",
    85
);

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (

    id             INT          NOT NULL AUTO_INCREMENT,
    first_name     VARCHAR(255) DEFAULT NULL,
    last_name      VARCHAR(255) NOT NULL,
    email          VARCHAR(255) DEFAULT NULL,
    linkedin_url   VARCHAR(255) DEFAULT NULL,
    headshot_url   VARCHAR(255) DEFAULT NULL,
    discord_handle VARCHAR(255) DEFAULT NULL,
    brief_bio      VARCHAR(255) DEFAULT NULL,
    date_joined    DATE         NOT NULL,

    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (first_name, last_name, email, date_joined)
VALUES
( "Alex",     "Person 1", "alexofmacedon@cox.net",       "2014-06-30" ),
( "Isaac",    "Person 2", "applehead@gmail.com",         "2014-07-21" ),
( "Ernesto",  "Person 3", "drche28@aol.com",             "2015-01-05" ),
( "Sid",      "Person 4", "gautamas@vcu.edu",            "2015-01-05" ),
( "Martin",   "Person 5", "eucharist_ftw@gmail.com",     "2015-11-15" ),
( "Florence", "Person 6", "alenighter@cox.net",          "2016-05-11" ),
( "Marie",    "Person 7", "prussian_in_paris@gmail.com", "2016-05-13" ),
( "Freddy",   "Person 8", "poorboy7@gmail.com",          "2016-10-08" ),
( "Abe",      "Person 9", "theatrelover12@cox.net",      "2017-02-27" ),
( "John",     "Person 10", "nashj@vcu.edu",              "2017-03-02" );

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (

    id            INT  NOT NULL AUTO_INCREMENT,
    skills_id     INT  NOT NULL,
    people_id     INT  NOT NULL,
    date_acquired DATE NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (people_id, skills_id, date_acquired)
VALUES

( 1, 1, "2014-07-27" ),
( 1, 3, "2014-07-23" ),
( 1, 6, "2014-07-23" ),

( 2, 3, "2014-08-15" ),
( 2, 4, "2014-08-24" ),
( 2, 5, "2014-09-01" ),

( 3, 1, "2015-01-05" ),
( 3, 5, "2015-01-05" ),

( 5, 3, "2015-11-20" ),
( 5, 6, "2015-11-15" ),

( 6, 2, "2016-05-11" ),
( 6, 3, "2016-05-13" ),
( 6, 4, "2016-07-07" ),

( 7, 3, "2017-01-12" ),
( 7, 5, "2016-05-13" ),
( 7, 6, "2017-01-12" ),

( 8, 1, "2017-02-02" ),
( 8, 3, "2016-10-30" ),
( 8, 5, "2016-10-20" ),
( 8, 6, "2017-02-04" ),

( 9, 2, "2017-03-05" ),
( 9, 5, "2017-03-02" ),
( 9, 6, "2017-04-16" ),

( 10, 1, "2017-08-20" ),
( 10, 4, "2017-04-06" ),
( 10, 5, "2017-03-02" );

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (

    id            INT          NOT NULL AUTO_INCREMENT,
    name          VARCHAR(255) NOT NULL,
    sort_priority INT          NOT NULL,

    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (name, sort_priority)
VALUES
( "Designer",  10 ),
( "Developer", 20 ),
( "Recruit",   30 ),
( "Team Lead", 40 ),
( "Boss",      50 ),
( "Mentor",    60 );

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (

    id            INT  NOT NULL AUTO_INCREMENT,
    people_id     INT  NOT NULL,
    role_id       INT  NOT NULL,
    date_assigned DATE NOT NULL,

    PRIMARY KEY (id),
    FOREIGN KEY (people_id) references people(id),
    FOREIGN KEY (role_id)  references roles(id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned)
VALUES
( 1, 2, "2014-06-30" ),
( 2, 5, "2014-07-21" ),
( 2, 6, "2015-01-05" ),
( 3, 2, "2015-01-05" ),
( 3, 4, "2015-02-01" ),
( 4, 3, "2015-01-05" ),
( 5, 3, "2015-11-15" ),
( 6, 2, "2016-05-11" ),
( 6, 1, "2016-05-18" ),
( 7, 1, "2016-05-13" ),
( 8, 1, "2016-10-08" ),
( 8, 4, "2017-01-15" ),
( 9, 2, "2017-02-27" ),
( 10, 2, "2017-03-02" ),
( 10, 1, "2017-04-20" );