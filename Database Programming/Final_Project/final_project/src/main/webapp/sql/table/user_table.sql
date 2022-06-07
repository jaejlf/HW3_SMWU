CREATE TABLE USER_TABLE
(
    user_id      VARCHAR2(20)    NOT NULL, 
    pwd          VARCHAR2(20)    NOT NULL, 
    birthdate    DATE            NOT NULL, 
    name         VARCHAR2(20)    NOT NULL, 
    PRIMARY KEY (user_id)
);