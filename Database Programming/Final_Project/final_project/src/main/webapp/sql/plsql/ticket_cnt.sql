CREATE OR REPLACE PROCEDURE ticket_cnt(
	result OUT NUMBER
)
IS
	CURSOR booking_list IS
		SELECT running_movie_id
		FROM BookingList;
	cnt NUMBER;

BEGIN
	OPEN booking_list;
	
	LOOP
		FETCH booking_list INTO cnt;
		EXIT WHEN booking_list %NOTFOUND;
	END LOOP;
	
	result := booking_list%ROWCOUNT;
	DBMS_OUTPUT.PUT_LINE('총 예매 티켓 수 : ' || result);
	CLOSE booking_list;

	EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('에러발생');
END;
/