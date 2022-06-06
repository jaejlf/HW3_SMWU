CREATE TABLE SEAT_INFO_TABLE(
	theater_id NUMBER(3),
	seat_id VARCHAR2(5),
	price NUMBER(5) NOT NULL,
	constraint seat_info_pk PRIMARY KEY(theater_id, seat_id)
);