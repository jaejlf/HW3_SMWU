CREATE OR REPLACE PROCEDURE get_movie_info(
	o_movie_title OUT VARCHAR2,
	o_adult_only OUT CHAR,
	o_movie_date OUT DATE,
	o_start_time OUT VARCHAR2,
	o_end_time OUT VARCHAR2
)
IS
		Info MovieInfoView%ROWTYPE;

BEGIN
	SELECT movie_title, adult_only, movie_date, start_time, end_time
		INTO Info.movie_title, Info.adult_only, Info.movie_date, Info.start_time, Info.end_time
	FROM MovieInfoView;
	
	o_movie_title := Info.movie_title;
	o_adult_only := Info.adult_only;
	o_movie_date := Info.movie_date ;
	o_start_time := Info.start_time ;
	o_end_time := Info.end_time ;

END;
/