CREATE OR REPLACE VIEW MovieInfoView (running_movie_id, movie_title, adult_only, movie_date, start_time, end_time)
AS SELECT Run.running_movie_id, Movie.movie_title, Movie.adult_only, Run.movie_date, Run.start_time, Run.end_time
FROM Running_Movie_Table Run JOIN Movie_Info_Table Movie ON Run.movie_id = Movie.movie_id;