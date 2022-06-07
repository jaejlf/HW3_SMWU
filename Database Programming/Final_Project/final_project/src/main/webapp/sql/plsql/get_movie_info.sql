CREATE OR REPLACE PROCEDURE get_movie_info (
	input_movie_id IN movie_info_table.movie_id%TYPE,
	o_movie_title OUT movie_info_table.movie_title%TYPE,
	o_adult_only OUT VARCHAR2,
	o_movie_date OUT DATE,
	o_start_time OUT VARCHAR2,
	o_end_time OUT VARCHAR2
)
IS
	Info MovieInfoView%ROWTYPE;

BEGIN
	SELECT movie_title, adult_only, movie_date, start_time, end_time
		INTO Info.movie_title, Info.adult_only, Info.movie_date, Info.start_time, Info.end_time
	FROM MovieInfoView
	WHERE running_movie_id = input_movie_id;
	
	o_movie_title := Info.movie_title;
	o_adult_only := Info.adult_only;
	o_movie_date := Info.movie_date;
	o_start_time := Info.start_time;
	o_end_time := Info.end_time;

END;
/