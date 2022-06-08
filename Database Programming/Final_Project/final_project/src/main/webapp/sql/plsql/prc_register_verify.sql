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
	--���̵� �Է� ����
	--4�ڸ� �ʰ�, 2�ڸ� �̸�, �Է� x, �� ĭ �����Ͽ� �Է��� ��� 
	IF(LENGTH(input_id) > 4) 
		THEN RAISE err_id_length_ovf;
	ELSIF(LENGTH(input_id) < 2) 
		THEN RAISE err_id_length_udf;
	ELSIF(LENGTH(input_id) IS NULL) 
		THEN RAISE err_id_length_null;
	ELSIF(INSTR(input_id, ' ') != 0)
		THEN RAISE err_id_blank;
	END IF;
	
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
	
	--������� �Է� ����
	--6�ڸ��� �ƴ� ���, �������� �ʴ� ��¥�� ���(ora-01861 �߻�) 
	IF(LENGTH(input_birthdate) != 6) 
		THEN RAISE err_birthdate_length;
	ELSIF(LENGTH(input_birthdate) IS NULL) 
		THEN RAISE err_birthdate_length;
	END IF;
	
	SELECT TO_DATE(input_birthdate) INTO check_bd FROM dual;
	
	--�̸� �Է� ����
	--�Է� x, �� ĭ �����Ͽ� �Է��� ���, 15�� �̻� �Է��� ���
	IF(LENGTH(input_name) > 14) 
		THEN RAISE err_name_length_ovf;
	ELSIF(LENGTH(input_name) IS NULL) 
		THEN RAISE err_name_length_null;
	ELSIF(INSTR(input_name, ' ') != 0)
		THEN RAISE err_name_blank;
	END IF;
	
	--insert ����
	INSERT INTO user_table VALUES(input_id, input_pwd, check_bd, input_name);
	INSERT INTO user_table_backup VALUES(input_id, input_pwd, check_bd, input_name);

	EXCEPTION
	WHEN err_id_length_ovf
		THEN raise_application_error(-20501, '���̵�� 4�ڸ� �� �����Դϴ�');
	WHEN err_id_length_udf
		THEN raise_application_error(-20502, '���̵�� 2�ڸ� �� �̻��Դϴ�');
	WHEN err_id_length_null
		THEN raise_application_error(-20503, '���̵� �Էµ��� �ʾҽ��ϴ�');
	WHEN err_pwd_length_ovf
		THEN raise_application_error(-20504, '��й�ȣ�� 4�ڸ� �� �����Դϴ�');
	WHEN err_pwd_length_udf
		THEN raise_application_error(-20505, '��й�ȣ�� 2�ڸ� �� �̻��Դϴ�');
	WHEN err_pwd_length_null
		THEN raise_application_error(-20506, '��й�ȣ�� �Էµ��� �ʾҽ��ϴ�');
	WHEN err_birthdate_length
		THEN raise_application_error(-20507, '�Է� ������ ex)990101 �Դϴ�');
	WHEN err_id_blank
		THEN raise_application_error(-20508, '���̵𿡴� ������ ���Ե� �� �����ϴ�');
	WHEN err_pwd_blank
		THEN raise_application_error(-20509, '��й�ȣ���� ������ ���Ե� �� �����ϴ�');
	WHEN err_name_length_ovf
		THEN raise_application_error(-20510, '�̸��� 15�ڸ��� ���� �� �����ϴ�.');
	WHEN err_name_blank
		THEN raise_application_error(-20511, '�̸����� ������ ���Ե� �� �����ϴ�');
	WHEN err_name_length_null
		THEN raise_application_error(-20512, '�̸��� �Էµ��� �ʾҽ��ϴ�');
END;
/