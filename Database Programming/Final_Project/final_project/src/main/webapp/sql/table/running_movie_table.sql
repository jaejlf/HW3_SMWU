CREATE TABLE RUNNING_MOVIE_TABLE
(
    running_movie_id    NUMBER(3)       NOT NULL, 
    movie_id            NUMBER(3)       NOT NULL, 
    theater_id          NUMBER(3)       NOT NULL, 
    start_time          VARCHAR2(10)    NOT NULL, 
    end_time            VARCHAR2(10)    NOT NULL, 
    movie_date          DATE            NOT NULL, 
    PRIMARY KEY (running_movie_id)
);

ALTER TABLE RUNNING_MOVIE_TABLE
    ADD CONSTRAINT RMT_movie_id_FK FOREIGN KEY (movie_id)
        REFERENCES MOVIE_INFO_TABLE (movie_id);