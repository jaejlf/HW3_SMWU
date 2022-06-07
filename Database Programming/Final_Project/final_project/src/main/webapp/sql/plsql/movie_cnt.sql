CREATE OR REPLACE PROCEDURE movie_cnt (
	result OUT NUMBER
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
	
	result := movie_list%ROWCOUNT;
	CLOSE movie_list;

	EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('에러발생');
END;
/