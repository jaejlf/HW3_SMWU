CREATE OR REPLACE PROCEDURE prc_register_verify(
	input_id IN VARCHAR2,
	input_pwd IN VARCHAR2,
	input_birthdate IN VARCHAR2,
	input_name IN VARCHAR2
)
IS
	err_id_length_ovf EXCEPTION;
	err_id_length_udf EXCEPTION;
	err_id_length_null EXCEPTION;
	err_id_blank EXCEPTION;
	
	err_pwd_length_ovf EXCEPTION;
	err_pwd_length_udf EXCEPTION;
	err_pwd_length_null EXCEPTION;
	err_pwd_blank EXCEPTION;
	
	err_birthdate_length EXCEPTION;
	check_bd DATE;
	
	err_name_length_ovf EXCEPTION;
	err_name_length_null EXCEPTION;
	err_name_blank EXCEPTION;


BEGIN
	--아이디 입력 오류
	--4자리 초과, 2자리 미만, 입력 x, 빈 칸 포함하여 입력한 경우 
	IF(LENGTH(input_id) > 4) 
		THEN RAISE err_id_length_ovf;
	ELSIF(LENGTH(input_id) < 2) 
		THEN RAISE err_id_length_udf;
	ELSIF(LENGTH(input_id) IS NULL) 
		THEN RAISE err_id_length_null;
	ELSIF(INSTR(input_id, ' ') != 0)
		THEN RAISE err_id_blank;
	END IF;
	
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
	
	--생년월일 입력 오류
	--6자리가 아닌 경우, 존재하지 않는 날짜인 경우(ora-01861 발생) 
	IF(LENGTH(input_birthdate) != 6) 
		THEN RAISE err_birthdate_length;
	ELSIF(LENGTH(input_birthdate) IS NULL) 
		THEN RAISE err_birthdate_length;
	END IF;
	
	SELECT TO_DATE(input_birthdate) INTO check_bd FROM dual;
	
	--이름 입력 오류
	--입력 x, 빈 칸 포함하여 입력한 경우, 15자 이상 입력한 경우
	IF(LENGTH(input_name) > 14) 
		THEN RAISE err_name_length_ovf;
	ELSIF(LENGTH(input_name) IS NULL) 
		THEN RAISE err_name_length_null;
	ELSIF(INSTR(input_name, ' ') != 0)
		THEN RAISE err_name_blank;
	END IF;
	
	--insert 오류
	INSERT INTO user_table VALUES(input_id, input_pwd, check_bd, input_name);
	INSERT INTO user_table_backup VALUES(input_id, input_pwd, check_bd, input_name);

	EXCEPTION
	WHEN err_id_length_ovf
		THEN raise_application_error(-20501, '아이디는 4자리 수 이하입니다');
	WHEN err_id_length_udf
		THEN raise_application_error(-20502, '아이디는 2자리 수 이상입니다');
	WHEN err_id_length_null
		THEN raise_application_error(-20503, '아이디가 입력되지 않았습니다');
	WHEN err_pwd_length_ovf
		THEN raise_application_error(-20504, '비밀번호는 4자리 수 이하입니다');
	WHEN err_pwd_length_udf
		THEN raise_application_error(-20505, '비밀번호는 2자리 수 이상입니다');
	WHEN err_pwd_length_null
		THEN raise_application_error(-20506, '비밀번호가 입력되지 않았습니다');
	WHEN err_birthdate_length
		THEN raise_application_error(-20507, '입력 형식은 ex)990101 입니다');
	WHEN err_id_blank
		THEN raise_application_error(-20508, '아이디에는 공백이 포함될 수 없습니다');
	WHEN err_pwd_blank
		THEN raise_application_error(-20509, '비밀번호에는 공백이 포함될 수 없습니다');
	WHEN err_name_length_ovf
		THEN raise_application_error(-20510, '이름은 15자리를 넘을 수 없습니다.');
	WHEN err_name_blank
		THEN raise_application_error(-20511, '이름에는 공백이 포함될 수 없습니다');
	WHEN err_name_length_null
		THEN raise_application_error(-20512, '이름이 입력되지 않았습니다');
END;
/