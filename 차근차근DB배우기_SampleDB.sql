/*                                                                        */
/*              SampleDB.SQL - Creates the SampleDB database              */ 
/*                                                                        */
/*                                                                        */

SET NOCOUNT ON
GO

set nocount    on

USE master

declare @dttm VARCHAR(55)
select  @dttm=convert(VARCHAR,getdate(),102)
raiserror('SampleDB.SQL시작 :  %s ',1,1,@dttm) with nowait

GO

if exists (select * from sysdatabases where name='SampleDB')
begin
  raiserror('기존에 존재하는 SampleDB를 삭제하는 중 ....',0,1)
  DROP database SampleDB
end
GO

CHECKPOINT
go

raiserror('SampleDB database를 생성하는 중....',0,1)
go

CREATE DATABASE SampleDB
GO

USE SampleDB
GO

if db_name() <> 'SampleDB'
   raiserror('SampleDB사용오류..',0,1)

GO

-- 1. 성적테이블 생성
CREATE TABLE 성적
(학번 CHAR(9) PRIMARY KEY,
 이름 VARCHAR(20),
 성별 CHAR(2),
 반   CHAR(10),
 점수 INT)    

INSERT INTO 성적 VALUES('202101001','박보검','남','A',90)
INSERT INTO 성적 VALUES('202101002','송혜교','여','A',75)
INSERT INTO 성적 VALUES('202101003','손예진','여','A',77)
INSERT INTO 성적 VALUES('202101004','윤균상','남','A',85)
INSERT INTO 성적 VALUES('202101005','이종석','남','A',95)
INSERT INTO 성적 VALUES('202101006','여진구','남','A',80)
INSERT INTO 성적 VALUES('202101007','박보영','여','A',95)
INSERT INTO 성적 VALUES('202101008','한효주','여','A',90)
INSERT INTO 성적 VALUES('202101009','송중기','남','A',83)
INSERT INTO 성적 VALUES('202101010','김수현','남','A',88)
INSERT INTO 성적 VALUES('202101011','김유정','여','B',75)
INSERT INTO 성적 VALUES('202101012','유승호','남','B',84)
INSERT INTO 성적 VALUES('202101013','박신혜','여','B',80)
INSERT INTO 성적 VALUES('202101014','한지민','여','B',94)
INSERT INTO 성적 VALUES('202101015','이승기','남','B',78)
INSERT INTO 성적 VALUES('202101016','박민영','여','B',71)
INSERT INTO 성적 VALUES('202101017','정해인','남','B',87)
INSERT INTO 성적 VALUES('202101018','김태리','여','B',90)
INSERT INTO 성적 VALUES('202101019','조정석','남','B',94)
INSERT INTO 성적 VALUES('202101020','김태희','여','B',78)

-- 2.출판사 테이블 생성
 CREATE TABLE 출판사
 (출판사코드 CHAR(4) PRIMARY KEY,
  출판사명 VARCHAR(30) NOT NULL,
  주소 VARCHAR(100),
  전화번호 CHAR(13))

  INSERT INTO 출판사 VALUES('P001','북출판사','부산시 동래구','051-550-111')
  INSERT INTO 출판사 VALUES('P002','A&B출판사','서울시 성북구','02-224-123')
  INSERT INTO 출판사 VALUES('P003','독서출판','서울시 종로구','02-722-222')
  INSERT INTO 출판사 VALUES('P004','W출판사','대전시 중구','042-112-333')
  INSERT INTO 출판사 VALUES('P005','풀숲출판사','제주 제주시','064-777-321')

-- 3.책 테이블 생성
CREATE TABLE 책
(책코드 CHAR(5) PRIMARY KEY,
 책제목 VARCHAR(100) NOT NULL,
 분야 CHAR(10),
 출판사코드 CHAR(4) FOREIGN KEY REFERENCES 출판사(출판사코드),
 가격 INT,
 출간날짜 CHAR(7) NOT NULL)

INSERT INTO 책 VALUES('C1034','파스타요리','요리','P004',7500,'2011/05')
INSERT INTO 책 VALUES('C1051','지중해요리','요리','P003',10000,'2012/05')
INSERT INTO 책 VALUES('I2021','운영체제','컴퓨터','P001',12000,'2014/12')
INSERT INTO 책 VALUES('I2157','자바프로그래밍','컴퓨터','P003',12000,'2014/03')
INSERT INTO 책 VALUES('I2205','자료구조','컴퓨터','P005',11500,'2013/02')
INSERT INTO 책 VALUES('E3089','사회적 경제의 이해','경제','P004',12000,'2010/08')
INSERT INTO 책 VALUES('E3111','세계의 경제지표','경제','P001',13000,'2012/11')
INSERT INTO 책 VALUES('E3324','경제학원론','경제','P002',15000,'2015/01')
INSERT INTO 책 VALUES('P4077','행동의심리학','심리','P005',11500,'2014/09')
INSERT INTO 책 VALUES('P4101','심리학의 이해','심리','P002',12000,'2015/01')

-- 4. 학과 테이블 생성
CREATE TABLE 학과
(학과코드 CHAR(2) PRIMARY KEY,
 학과명 CHAR(30) NOT NULL,
 전화 CHAR(13) ) 
 
 INSERT INTO 학과 VALUES('11','유아교육','02-123-771')
 INSERT INTO 학과 VALUES('12','컴퓨터공학','02-123-772')
 INSERT INTO 학과 VALUES('13','식품영양','02-123-773')
 INSERT INTO 학과 VALUES('14','경영','02-123-774')
 INSERT INTO 학과 VALUES('15','영어영문','02-123-775')

--5. 교수 테이블 생성
CREATE TABLE 교수
(교수코드 CHAR(3) PRIMARY KEY,
 교수명 CHAR(20) NOT NULL,
 학과코드 CHAR(2) NOT NULL FOREIGN KEY REFERENCES 학과(학과코드),
 전공명 CHAR(20) )
 INSERT INTO 교수 VALUES('P01','박영희','11','유아심리')
 INSERT INTO 교수 VALUES('P02','김철수','12','알고리즘')
 INSERT INTO 교수 VALUES('P03','남소연','11','아동복지')
 INSERT INTO 교수 VALUES('P04','송재민','14','재무')
 INSERT INTO 교수 VALUES('P05','김나연','12','통신')
 INSERT INTO 교수 VALUES('P06','오승재','15','영문학')
 INSERT INTO 교수 VALUES('P07','최석민','15','영어음운학')
 INSERT INTO 교수 VALUES('P08','이지은','14','마케팅')
 INSERT INTO 교수 VALUES('P09','강승우','13','식품학')
 INSERT INTO 교수 VALUES('P10','윤은정','13','임상영양')
 
 --6. 교과목 테이블 생성
 CREATE TABLE 교과목
(과목코드 CHAR(4) PRIMARY KEY,
 과목명 CHAR(30) NOT NULL,
 담당교수 CHAR(3) ) 
 INSERT INTO 교과목 VALUES('A101','식품재료학','P09')
 INSERT INTO 교과목 VALUES('A102','식품미생물학','P10')
 INSERT INTO 교과목 VALUES('K201','데이터통신','P05')
 INSERT INTO 교과목 VALUES('K202','자바프로그래밍','P02')
 INSERT INTO 교과목 VALUES('C401','아동복지학','P03')
 INSERT INTO 교과목 VALUES('C402','영유아발달학','P01')
 INSERT INTO 교과목 VALUES('M301','마케팅원론','P08')
 INSERT INTO 교과목 VALUES('M302','회계원리','T01')
 INSERT INTO 교과목 VALUES('E501','초급영작문','P06')
 INSERT INTO 교과목 VALUES('E502','영어학개론','P07')

-- 7. 제품 테이블 생성

CREATE TABLE 제품
 (
 제품번호 INT PRIMARY KEY,
 제품명 CHAR(20),
 종류 CHAR(20),
 색상 CHAR(10),
 가격 INT
 )

 INSERT INTO 제품 VALUES(1,'롱코트','코트','BLACK',150000)
 INSERT INTO 제품 VALUES(2,'하프코트','코트','RED',130000)
 INSERT INTO 제품 VALUES(3,'짚업점퍼','점퍼','BROWN',55000)
 INSERT INTO 제품 VALUES(4,'후드점퍼','점퍼','YELLOW',63000)
 INSERT INTO 제품 VALUES(5,'가죽자켓','자켓','BLACK',82000)
 INSERT INTO 제품 VALUES(6,'주름스커트','스커트','WHITE',65000)
 INSERT INTO 제품 VALUES(7,'옥스포드셔츠','셔츠','WHITE',15000)
 INSERT INTO 제품 VALUES(8,'블라우스','셔츠','PINK',35000)
 INSERT INTO 제품 VALUES(9,'원피스','원피스','BLUE',95000)
 INSERT INTO 제품 VALUES(10,'반바지','바지','WHITE',35000)
 INSERT INTO 제품 VALUES(11,'장갑','패션잡화','RED',NULL)
 INSERT INTO 제품 VALUES(12,'목도리','패션잡화','BEIGE',NULL)

 -- 8. 판매이블 생성
 CREATE TABLE 판매
 (
 판매번호 INT IDENTITY,
 제품번호 INT FOREIGN KEY REFERENCES 제품(제품번호),
 판매수량 INT,
 판매날짜 CHAR(10) 
 )
 
 INSERT INTO 판매 VALUES(1,10,'2022/02/11')
 INSERT INTO 판매 VALUES(2,12,'2022/02/11')
 INSERT INTO 판매 VALUES(2,15,'2022/02/12')
 INSERT INTO 판매 VALUES(4,21,'2022/02/13')
 INSERT INTO 판매 VALUES(7,17,'2022/02/16')
 INSERT INTO 판매 VALUES(4,11,'2022/02/16')
 INSERT INTO 판매 VALUES(10,3,'2022/02/17')

-- merge 예제로 대상 테이블, 소스 테이블 생성
 CREATE TABLE 대상
 (사번 INT PRIMARY KEY,
 이름 VARCHAR(10) NOT NULL,
 직급 VARCHAR(10) NOT NULL,
 부서 CHAR(20) NOT NULL)
 
 INSERT INTO 대상 VALUES(1,'홍길동','부장','홍보부')
 INSERT INTO 대상 VALUES(2,'김선달','부장','인사부')
 INSERT INTO 대상 VALUES(3,'이도령','과장','홍보부')
  
 CREATE TABLE 소스
 (사번 INT PRIMARY KEY,
 이름 VARCHAR(10) NOT NULL,
 직급 VARCHAR(10) NOT NULL,
 부서 CHAR(20) NOT NULL)
 
 INSERT INTO 소스 VALUES(1,'홍길동','부장','국제마케팅부')
 INSERT INTO 소스 VALUES(3,'이도령','부장','홍보부')
 INSERT INTO 소스 VALUES(4,'성춘향','과장','영업부')

 -- 팀장 현황 테이블 생성
  CREATE TABLE 팀장현황 

(사번 CHAR(5),
  사원명 VARCHAR(20) NOT NULL,
  업무 VARCHAR(20),
  부서 CHAR(3),
  팀장 CHAR(5))
INSERT INTO 팀장현황 VALUES('1','마동석','대표이사','D00',null)
INSERT INTO 팀장현황 VALUES('2','김고은','일반디자이너','D02','7')
INSERT INTO 팀장현황 VALUES('3','유연석','프로그래머','D01','10')
INSERT INTO 팀장현황 VALUES('4','차태현','마케팅매니저','D03','1')
INSERT INTO 팀장현황 VALUES('5','고아라','일반디자이너','D02','7')
INSERT INTO 팀장현황 VALUES('6','황정민','영업','D03','4')
INSERT INTO 팀장현황 VALUES('7','정소민','수석디자이너','D02','1')
INSERT INTO 팀장현황 VALUES('8','하정우','영업','D03','4')
INSERT INTO 팀장현황 VALUES('9','박서준','프로그래머','D01','10')
INSERT INTO 팀장현황 VALUES('10','강동원','프로그램관리','D01','1')


 
 -- 사원업무 테이블 생성
CREATE TABLE 사원업무(
 사번 int IDENTITY(1,1) NOT NULL,
 이름 VARCHAR(10),
 시급 int,
 연봉 int,
 판매수량 int,
 커미션 int,
 업무 VARCHAR(50)
)

INSERT INTO 사원업무(이름,시급,업무) VALUES('홍길동',8500,'문서수발')
INSERT INTO 사원업무(이름,시급,업무) VALUES('김선달',9000,'문서정리')
INSERT INTO 사원업무(이름,시급,업무) VALUES('성춘향',9000,'고객상담')
INSERT INTO 사원업무(이름,연봉,업무) VALUES('변학도',35000000,'홍보팀장')
INSERT INTO 사원업무(이름,연봉,업무) VALUES('김철수',34000000,'전산팀장')
INSERT INTO 사원업무(이름,판매수량,업무) VALUES('이방자',1950,'서비스')

-- 졸작평가 테이블 생성
create table 졸작평가
(학번 varchar(9) primary key,
이름 varchar(20) not null,
점수 int,
조이름 varchar(20) 
)
insert into 졸작평가 values('202101001','박보검',81,'베스트')
insert into 졸작평가 values('202101002','송혜교',88,'학교짱')
insert into 졸작평가 values('202101003','손예진',85,'무한도전')
insert into 졸작평가 values('202101004','윤균상',86,'점수조')
insert into 졸작평가 values('202101005','이종석',78,'예쁘조')
insert into 졸작평가 values('202101006','여진구',84,'무한도전')
insert into 졸작평가 values('202101007','박보영',90,'예쁘조')
insert into 졸작평가 values('202101008','한효주',87,'무한도전')
insert into 졸작평가 values('202101009','송중기',93,'학교짱')
insert into 졸작평가 values('202101010','김수현',80,'학교짱')
insert into 졸작평가 values('202101011','김유정',78,'베스트')
insert into 졸작평가 values('202101012','유승호',94,'예쁘조')
insert into 졸작평가 values('202101013','박신혜',83,'점수조')
insert into 졸작평가 values('202101014','한지민',75,'학교짱')
insert into 졸작평가 values('202101015','이승기',85,'베스트')
insert into 졸작평가 values('202101016','박민영',79,'점수조')
insert into 졸작평가 values('202101017','정해인',91,'무한도전')
insert into 졸작평가 values('202101018','김태리',89,'점수조')
insert into 졸작평가 values('202101019','조정석',90,'베스트')
insert into 졸작평가 values('202101020','김태희',81,'예쁘조')
 

-- 모의고사 테이블 생성
 CREATE TABLE 모의고사
 (이름 VARCHAR(10),
  과목 CHAR(4),
  점수 INT)

-- 모의고사 데이터 입력

 INSERT 모의고사 VALUES('홍길동','국어',80)
 INSERT 모의고사 VALUES('홍길동','영어',90)
 INSERT 모의고사 VALUES('홍길동','수학',85)
 INSERT 모의고사 VALUES('김선달','국어',100)
 INSERT 모의고사 VALUES('김선달','영어',95)
 INSERT 모의고사 VALUES('김선달','수학',80)
 INSERT 모의고사 VALUES('홍길동','국어',80)
 INSERT 모의고사 VALUES('홍길동','영어',100)
 INSERT 모의고사 VALUES('홍길동','수학',97)
 INSERT 모의고사 VALUES('김선달','국어',100)
 INSERT 모의고사 VALUES('김선달','영어',90)
 INSERT 모의고사 VALUES('김선달','수학',85)
 

 CREATE TABLE 영업실적
(
상품명 VARCHAR(20) NOT NULL, 
월  INT NOT NULL,
판매량 INT NOT NULL)
INSERT INTO 영업실적 VALUES('청바지',1,15)
INSERT INTO 영업실적 VALUES('옥스포드셔츠',1,10)
INSERT INTO 영업실적 VALUES('가죽자켓',1,6)
INSERT INTO 영업실적 VALUES('청바지',2,22)
INSERT INTO 영업실적 VALUES('후드점퍼',2,11)
INSERT INTO 영업실적 VALUES('옥스포드셔츠',2,8)
INSERT INTO 영업실적 VALUES('청바지',3,28)
INSERT INTO 영업실적 VALUES('가죽자켓',3,7)
INSERT INTO 영업실적 VALUES('옥스포드셔츠',3,17)

CREATE TABLE 분기실적
(년도 CHAR(4),
 분기 CHAR(10),
 금액 INT)

INSERT INTO 분기실적 VALUES('2021','1분기',100)
INSERT INTO 분기실적 VALUES('2021','2분기',150)
INSERT INTO 분기실적 VALUES('2021','3분기',200)
INSERT INTO 분기실적 VALUES('2021','4분기',300)
INSERT INTO 분기실적 VALUES('2022','1분기',150)
INSERT INTO 분기실적 VALUES('2022','2분기',250)
INSERT INTO 분기실적 VALUES('2022','3분기',200)
INSERT INTO 분기실적 VALUES('2022','4분기',400)

  -- 상품 테이블 생성
 CREATE TABLE 상품
 (상품코드 CHAR(3) PRIMARY KEY,
  상품명   VARCHAR(15) NOT NULL,
  가격     INT NOT NULL,
  재고수량 INT DEFAULT 0)

-- 입고 테이블 생성
 CREATE TABLE 입고
 (입고번호 INT IDENTITY,
  상품코드 CHAR(3) FOREIGN KEY REFERENCES 상품(상품코드),
  입고날짜 CHAR(10),
  입고수량 INT NOT NULL)

-- 상품 테이블에 상품 데이터 추가
 INSERT INTO 상품 VALUES('P01','노트북',980000,0)
 INSERT INTO 상품 VALUES('P02','프린터',180000,0)
 

CREATE TABLE 기증내역
(번호 INT IDENTITY,
 물품코드 CHAR(3),
 기증자 CHAR(10),
 기증수량 INT)

CREATE TABLE 물품
(물품코드 CHAR(3),
 물품명 CHAR(20),
 수량 INT)

INSERT 기증내역 VALUES('p01','홍길동',10)
INSERT 기증내역 VALUES('p02','성춘향',5)
INSERT 기증내역 VALUES('p01','김선달',10)

INSERT 물품 VALUES('p01','장갑',20)
INSERT 물품 VALUES('p02','모자',5)

CREATE TABLE 고객
(고객id CHAR(10) UNIQUE NOT NULL,
 고객명 CHAR(20) NOT NULL,
 연락처	CHAR(13) NOT NULL,
 마일리지 INT,
 뉴스레터 CHAR(1))

  -- 고객테이블에 샘플레코드 입력
INSERT 고객 VALUES('111','김미경','010-23-5645', 500, 0)
INSERT 고객 VALUES('222','채경란','010-73-1234' ,860, 0)

CREATE TABLE 뉴스레터
(고객id CHAR(10) UNIQUE NOT NULL,
 고객명 CHAR(20) NOT NULL,
 연락처 CHAR(13) NOT NULL) 



USE master

declare @dttm VARCHAR(55)
select  @dttm=convert(VARCHAR,getdate(),102)
raiserror('SampleDB.SQL완료 :  %s ',1,1,@dttm) with nowait

GO
