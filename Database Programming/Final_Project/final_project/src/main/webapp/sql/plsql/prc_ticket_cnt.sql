CREATE OR REPLACE PROCEDURE ticket_cnt (
	input_user_id IN user_table.user_id%TYPE,
	result OUT NUMBER
)
IS
	CURSOR user_booking_list(cur_user_id VARCHAR2) IS
		SELECT running_movie_id
		FROM BookingList
		WHERE user_id = cur_user_id;
	cnt NUMBER := 0;

BEGIN
	FOR user_boooking IN user_booking_list(input_user_id) LOOP
		cnt := cnt + 1;
	END LOOP;
	
	result := cnt;
	DBMS_OUTPUT.PUT_LINE('총 예매 티켓 수 : ' || result);

	EXCEPTION
	WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('에러발생');
END;
/