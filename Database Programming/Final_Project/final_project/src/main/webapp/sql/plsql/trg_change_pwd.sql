CREATE OR REPLACE TRIGGER trg_change_pwd
BEFORE
UPDATE ON user_table
FOR EACH ROW
BEGIN
	UPDATE user_table_backup SET pwd = :old.pwd WHERE user_id = :old.user_id;
END;
/