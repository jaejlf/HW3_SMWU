CREATE TABLE USER_BOOKING_TABLE (
    booking_id NUMBER(3) PRIMARY KEY
    user_id VARCHAR2(20) NOT NULL,
    running_movie_id NUMBER(3) NOT NULL,
    theater_id NUMBER(3) NOT NULL,
    seat_id VARCHAR2(20) NOT NULL
);