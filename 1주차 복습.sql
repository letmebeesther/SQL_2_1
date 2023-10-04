create table 음식
(번호 int identity,
종류 char(10) check(종류 in ('중식','분식','한식','양식')),
음식명 char(20),
가격 int)
insert 음식 values('중식','짜장면',6000),('분식','떡볶이',5000),
('분식','김치볶음밥',4500), 
('한식','김치찌개',7000),('한식','된장찌개',7000),
('한식','궁중떡볶이',6000),('중식','짬뽕',6500),
('양식','피자',13000),('분식','김밥',3000),
('양식','토마토스파게티',8000)

create table 회원
(아이디  char(10) primary key,
이름 char(20) ,
주소 char(50))
insert 회원 values('jsk98','강주석','일산시 동구'),('bird123','최예은','서울시 강서구'),
('angel','이민경','서울시 영등포구')

select * from 음식

-- 1. '짜장면' 음식 정보를 출력하는 구문
select * from 음식 where 음식명 = '짜장면'

-- 2. '중식' 음식 정보를 출력하는 구문
select * from 음식 where 종류 = '중식'

-- 3. '떡볶이' 음식 정보를 출력하는 구문 (와일드카드)
select * from 음식 where 음식명 like '%떡볶이%'

-- 4. 음식 종류별 최저가격의 음식명과 가격을 출력하는 구문
select 종류,min(가격) 최저가격 from 음식
group by 종류

-- 5. 중식 종류 음식을 가격순 오름차순으로 정렬하여 출력하는 구문
select * from 음식 where 종류 = '중식'
order by 가격 desc

-- 6. 짜장면, 짬뽕, 피자 음식 정보만 출력하는 구문
select * from 음식 where 음식명 in ('짜장면','짬뽕','피자')

--7. 테이블 titles와 publishers를 조인하여 title, pub_name, price를 출력하시오. (pubs)
select * from titles
select * from publishers

select title,pub_name,price
from titles join publishers
on titles.pub_id = publishers.pub_id

--8. 테이블 책, 출판사를 기반으로 요리 분야의 책을 출판하는 출판사 명을 출력하시오.(서브쿼리, sampleDB)
select * from 책
select * from 출판사

select 출판사명 from 출판사 
where 출판사코드 in (select 출판사코드 from 책 where 분야 = '요리')

-- 9. 다음 정보를 기반으로 테이블 '#학생'을 생성하시오.
create table #학생(번호 int, 이름 char(20), 직업 char(30))
select * from #학생

--10. 테이블 '책'을 기반으로 복사본 '#책'을 생성하시오.