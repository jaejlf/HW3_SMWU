CREATE OR REPLACE FUNCTION how_old (
	input_user IN user_table.user_id%TYPE
)
RETURN NUMBER

IS
   birthday DATE;
   age NUMBER;
BEGIN
   SELECT birthdate
   INTO birthday
   FROM USER_TABLE WHERE user_id =input_user;

   SELECT trunc(months_between(sysdate, birthday)/12)
  		INTO age
   FROM dual;
   RETURN age;
END;
/