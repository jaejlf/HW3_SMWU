CREATE TABLE MOVIE_INFO_TABLE
(
    movie_id       NUMBER(3)        NOT NULL, 
    movie_title    VARCHAR2(100)    NOT NULL, 
    adult_only     CHAR(1)          NOT NULL, 
    PRIMARY KEY (movie_id)
);