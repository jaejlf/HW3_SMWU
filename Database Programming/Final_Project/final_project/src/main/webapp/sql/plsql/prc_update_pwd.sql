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
	--��й�ȣ �Է� ����
	--4�ڸ� �ʰ�, 2�ڸ� �̸�, �Է� x, �� ĭ �����Ͽ� �Է��� ��� 
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
		THEN raise_application_error(-20504, '��й�ȣ�� 4�ڸ� �� �����Դϴ�');
	WHEN err_pwd_length_udf
		THEN raise_application_error(-20505, '��й�ȣ�� 2�ڸ� �� �̻��Դϴ�');
	WHEN err_pwd_length_null
		THEN raise_application_error(-20506, '��й�ȣ�� �Էµ��� �ʾҽ��ϴ�');
	WHEN err_pwd_blank
		THEN raise_application_error(-20509, '��й�ȣ���� ������ ���Ե� �� �����ϴ�');
END;
/