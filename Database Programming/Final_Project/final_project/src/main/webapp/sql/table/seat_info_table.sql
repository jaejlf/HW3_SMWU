CREATE TABLE SEAT_INFO_TABLE
(
    theater_id    NUMBER(3)      NOT NULL, 
    seat_id       VARCHAR2(5)    NOT NULL, 
    price         NUMBER(5)      NOT NULL, 
    CONSTRAINT seat_info_pk PRIMARY KEY (theater_id, seat_id)
);