CREATE TABLE Running_Movie_Table (
	running_movie_id NUMBER(3) PRIMARY KEY,
	movie_id NUMBER(3) REFERENCES Movie_Info_Table(movie_id),
	theater_id NUMBER(3) NOT NULL,
	start_time VARCHAR2(10) NOT NULL,
	end_time VARCHAR2(10) NOT NULL,
	movie_date DATE NOT NULL	
);