CREATE OR REPLACE PROCEDURE movie_cnt (
	result_movie OUT NUMBER,
	result_run OUT NUMBER
)
IS
	CURSOR movie_list IS
		SELECT DISTINCT movie_id 
		FROM RUNNING_MOVIE_TABLE;
	cnt NUMBER;
BEGIN
	OPEN movie_list; 
	LOOP
		FETCH movie_list INTO cnt;
		EXIT WHEN movie_list%NOTFOUND;
	END LOOP;
	
	result_movie := movie_list%ROWCOUNT;
	CLOSE movie_list;

	Select count(*) 
  Into result_run
  from running_movie_table;

	EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('에러발생');
END;
/