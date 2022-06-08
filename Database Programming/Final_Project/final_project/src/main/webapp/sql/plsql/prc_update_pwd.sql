CREATE OR REPLACE PROCEDURE prc_update_pwd (
	input_user_id IN user_table.user_id%TYPE,
	input_pwd IN user_table.pwd%TYPE
)
IS
	err_pwd_length_ovf EXCEPTION;
	err_pwd_length_udf EXCEPTION;
	err_pwd_length_null EXCEPTION;
	err_pwd_blank EXCEPTION;

BEGIN
	--비밀번호 입력 오류
	--4자리 초과, 2자리 미만, 입력 x, 빈 칸 포함하여 입력한 경우 
	IF(LENGTH(input_pwd) > 4) 
		THEN RAISE err_pwd_length_ovf;
	ELSIF(LENGTH(input_pwd) < 2) 
		THEN RAISE err_pwd_length_udf;
	ELSIF(LENGTH(input_pwd) IS NULL) 
		THEN RAISE err_pwd_length_null;
	ELSIF(INSTR(input_pwd, ' ') != 0)
		THEN RAISE err_pwd_blank;
	END IF;

	UPDATE user_table SET pwd = input_pwd WHERE user_id = input_user_id;
	
	EXCEPTION
	WHEN err_pwd_length_ovf
		THEN raise_application_error(-20504, '비밀번호는 4자리 수 이하입니다');
	WHEN err_pwd_length_udf
		THEN raise_application_error(-20505, '비밀번호는 2자리 수 이상입니다');
	WHEN err_pwd_length_null
		THEN raise_application_error(-20506, '비밀번호가 입력되지 않았습니다');
	WHEN err_pwd_blank
		THEN raise_application_error(-20509, '비밀번호에는 공백이 포함될 수 없습니다');
END;
/