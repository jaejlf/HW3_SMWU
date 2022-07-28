# 영화 예매 시스템
![image](https://user-images.githubusercontent.com/78673570/181481221-26b8e202-91f0-4250-8235-f1a62b5d42f0.png)

## 🎬 프로젝트 소개
'데이터베이스 설계와 질의' 수업의 기말 프로젝트입니다. 다음의 내용을 반드시 적용하는 것이 주요 과제였고, 이를 구현하기에 '영화 예매 시스템'이 적절하다고 생각하여 주제로 선정하게 되었습니다.

- 스키마는 주요 constraints (pk, fk등) 명시. View 사용.
- 고급 SQL: subquery를 이용한 중첩질의, 조인. Oracle 함수 등
- %TYPE, %ROWTYPE, 조건문, 반복문, Exception 사용한 PLSQL
- 커서, 파라미터 있는 커서, stored procedure, stored function, trigger, prepared statement, callable statement, Null값 처리 등

<br>

핵심 기능은 다음과 같습니다.
1. 로그인/로그아웃
2. 영화 예매 내역 조회
3. 영화 예매 및 예매 취소
4. 사용자 정보 수정

<br><br>

## 🛠 기술 스택
- `Oracle DB`와 `Tomcat 웹서버`를 사용하였습니다.
- `JSP`를 사용해 웹 페이지 화면을 구현하였습니다.

<br><br>

## 👩‍💻 개발 내용
- 회원 - 로그인, 로그아웃, 회원가입, 사용자 정보 수정
- 예매 내역 조회, 영화 목록 조회를 위해 View 생성
- Sub Query를 사용하여 예매 가능한 좌석 조회
- 예매자 나이 계산을 위한 Stored Function
- 각 상황에 따른 예외 처리 Procedure
- 영화 정보 조회를 위한 Stored Procedure

<br><br>

## 💾 ERD Diagram
![image](https://user-images.githubusercontent.com/78673570/181481818-42bd918e-c668-4515-af12-f4d94df4cca1.png)

<br><br>

## ✒ 주요 SQL 질의문
### 예매 가능한 좌석을 불러오는 SELECT문 (booking.jsp)
```sql
SELECT seat_id FROM Seat_Info_Table
WHERE seat_id NOT IN (
SELECT seat_id
FROM User_Booking_Table
WHERE running_movie_id = "+ run_id + ") AND theater_id=" + theater_id + " order by seat_id";
```

<br>

### 예매 내역 리스트 SELECT문 (booking_list.jsp)
```sql
SELECT Run.running_movie_id, Movie.movie_title, Movie.adult_only, Run.movie_date, Run.start_time, Run.end_time
FROM Running_Movie_Table Run JOIN Movie_Info_Table Movie ON Run.movie_id = Movie.movie_id;
```

<br>

### 유저의 총 예매 티켓 수 Count PL/SQL (prc_ticket_cnt.sql)
```sql
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

```

<br>

### 비밀번호 수정 트리거(trg_change_pwd.sql) & 프로시저(prc_update_pwd.sql)
```sql
CREATE OR REPLACE TRIGGER trg_change_pwd
BEFORE
UPDATE ON user_table
FOR EACH ROW
BEGIN
	UPDATE user_table_backup SET pwd = :old.pwd WHERE user_id = :old.user_id;
END;
/

```
```sql
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

```

<br><br>

## 🔍 화면 구성
![image](https://user-images.githubusercontent.com/78673570/181482567-b32ed4f7-88da-4515-b42b-4eebe76a1cad.png)
![image](https://user-images.githubusercontent.com/78673570/181482574-e929cc3f-8a70-4ecb-ae59-93fb76971938.png)

