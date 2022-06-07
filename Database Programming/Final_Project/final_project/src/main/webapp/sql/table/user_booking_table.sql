CREATE TABLE USER_BOOKING_TABLE
(
    booking_id          NUMBER(3)       NOT NULL, 
    user_id             VARCHAR2(20)    NOT NULL, 
    running_movie_id    NUMBER(3)       NOT NULL, 
    theater_id          NUMBER(3)       NOT NULL, 
    seat_id             VARCHAR2(5)     NOT NULL, 
    PRIMARY KEY (booking_id)
);

ALTER TABLE USER_BOOKING_TABLE
    ADD CONSTRAINT UBT_user_id_FK FOREIGN KEY (user_id)
        REFERENCES USER_TABLE (user_id);

ALTER TABLE USER_BOOKING_TABLE
    ADD CONSTRAINT UBT_running_movie_id_FK FOREIGN KEY (running_movie_id)
        REFERENCES RUNNING_MOVIE_TABLE (running_movie_id);

ALTER TABLE USER_BOOKING_TABLE
    ADD CONSTRAINT UFK_theater_seat_id_FK FOREIGN KEY (theater_id, seat_id)
        REFERENCES SEAT_INFO_TABLE (theater_id, seat_id);

ALTER TABLE USER_BOOKING_TABLE ADD UNIQUE (running_movie_id, seat_id);