use frontend;
#DML (Data Manipulation Language) - 데이터 조작어
#	데이터들을 추가, 수정, 삭제, 조회 하는 명령어들
#	insert, update, delete, select

#insert
#insert into 테이블명 {(컬럼1, 컬럼2, ...)} values(값1, 값2, ...);
#컬럼들을 써준 경우에는 뒤에 올 값으로 그 컬럼들에 들어갈 값들을 써준다.
#컬럼의 개수와 자료형에 알맞게 순서대로 써주어야 한다.
insert into car(brand, price) values('Ferrari', 65000);

#컬럼을 생략한 경우에는 모든 컬럼에 값을 넣어주겠다는 뜻이다.
#따라서 모든 컬럼에 들어갈 값들을 컬럼 순서대로 전부 작성해준다.
insert into car values('K7', 'White', 7000);

#useridx는 자동 increment number, regdate는 default값 이기 때문에
#insert 해주지 않아도 자동으로 입력이 된다.
insert into tb_user(userid, userpw, username, userphone, 
useremail, userhobby, zipcode, address1, address2, address3) 
values ('apple', '1111', '김사과', '01012341234', 'apple@juice.com',
'코딩', '10101', '서울시 강남구 테헤란로', '11-1 101동 101호', '(역삼동)');

insert into tb_user(userid, userpw, username, userphone, 
useremail, userhobby, zipcode, address1, address2, address3) 
values ('banana', '2222', '반하나', '01098769876', 'banana@juice.com',
'영화', '10102', '서울시 서초구 과천대로', '22-1 15-3번지', '(방배동)');

insert into tb_user(userid, userpw, username, userphone, 
useremail, userhobby, zipcode, address1, address2, address3) 
values ('cherry', '3333', '이체리', '01011111111', 'cherry@juice.com',
'게임', '15101', '경기도 안양시 동안구 관평로 138번길 63', '707동 1303호', '(평촌동)');

insert into tb_user(userid, userpw, username, userphone, zipcode, address2) 
values ('durian', '4444', '차두리', '01024242424', '10001', '한강뷰아파트 101동 1001호');

#select로 간단하게 구조 확인하기
select * from tb_user;

#userpoint 컬럼 추가
alter table tb_user add (userpoint int default 0);

#update
#update 테이블명 set 컬럼명 = 새로운값 where 조건절;
#조건 없이 모든 행을 수정해야 한다면 조건절 생략 가능
update tb_user set userpoint = 1000;
#safe 모드 해제 : edit - preferences - SQL Editor - 맨 아래의 Safe Updates 체크 해제

update tb_user set userpoint = userpoint + 200 where useridx = 1; 
update tb_user set userpoint = userpoint - 200 where useridx = 2; 
update tb_user set userpoint = userpoint * 2 where useridx = 3;
update tb_user set userpoint = 1200 where userid = 'durian';

#delete
#delete from 테이블명 where 조건절;
delete from car where brand ='Ferrari';
select * from car;

#select
#select 컬럼1, 컬럼2, ... from 테이블명 where 조건절;
select userid, username, userpoint from tb_user;
#관계연산자(부등호, 등호)
select userid, username, userphone, address1 from tb_user where useridx = 2;
select username from tb_user where userpoint > 1000;
#논리연산자(and, or not)
select username from tb_user where userid='apple' and userpw='1111';
#userpoint가 500보다 크거나 같고 1500보다 작거나 같은 회원의 아이디, 이름, 포인트 검색
select userid, username, userpoint from tb_user where userpoint >=500 and userpoint <=1500;
#컬럼 between A and B : 컬럼의 값이 A 이상 B 이하
select userid, username, userpoint from tb_user where userpoint between 500 and 1500;
#email이 NULL인 사람의 이름 검색
#null의 값비교는 is null, is not null
select username from tb_user where useremail is null;
#회원의 아이디가 apple 또는 banana 또는 cherry인 사람들의 이름 검색
select username from tb_user where userid = 'apple' or userid = 'banana' or userid = 'cherry';
#컬럼 in (값1, 값2, ...) : 컬럼의 값이 값1, 값2, ...에 있으면 참
select username from tb_user where userid in ('apple', 'banana', 'cherry');
#id에 'a'가 들어가는 모든 사람 검색
select userid, username from tb_user where userid like ('%a%');
#'%a' : 맨 뒷 글자가 a인 아무 문자열
#'a%e' : a에서 시작해서 e로 끝나는 아무 문자열
#'_a' : 맨 뒷글자가 a인 두 글자 문자열
#'a_p%e' : a + 아무 한 글자 + p + 아무 문자열 + e

#정렬
#order by 컬럼명 {정렬기준} : 컬럼을 기준으로 정렬(정렬기준 생략시 오름차순) - 정렬기준에 DESC를 작성시 내림차순
select * from tb_user order by userid desc;
#userpoint로 먼저 정렬한 뒤, userpoint 값이 같은, 즉 같은 그룹 안에서 다시 userid로 정렬
select * from tb_user order by userpoint desc, userid desc;

#성별 컬럼 추가
alter table tb_user add (usergender enum('남자', '여자')); #enum 데이터 타입 : 특정 값 말고는 데이터로 들어올 수 없음
update tb_user set usergender = '남자' where useridx = 1 or useridx = 3;
update tb_user set usergender = '여자' where useridx = 2 or useridx = 4;

#그룹함수(집계함수) - 여러 행의 데이터들을 종합적으로 확인 후 결과를 도출하는 함수 / SUM(), AVG, MAX, MIN, COUNT()
select sum(userpoint) from tb_user;
select sum(userpoint) from tb_user where usergender = '남자';

#group by
#group by 컬럼, ... : 컬럼을 기준으로 그룹을 짓고 쿼리문 실행, 그룹함수가 적용될 파트를 나누는 문장
select usergender, sum(userpoint) from tb_user group by usergender;

#userpoint가 1000이하인 사람들만 모아서 usergender로 그룹을 나누고 그룹별 포인트 총 합을 구해라!
select usergender, sum(userpoint) from tb_user where userpoint<=1000 group by usergender;

#usergender로 그룹을 나누고 그룹별 포인트 총 합을 구한 후 포인트 총 합이 2000보다 작거나 같은 그룹의 결과만 구해라!
select usergender, sum(userpoint) from tb_user group by usergender having sum(userpoint)<=2000;

#즉, where는 데이터들에 대한 조건절, having은 그룹에 대한 조건절

#별칭
#컬럼명 별칭, 혹은 컬럼명 AS 별칭 / from 테이블명 별칭
#별칭에 띄어쓰기 들어가면 '' 로 감싸야 함
select userid 아이디, username 이름, zipcode 우편번호, address1 '도로명 주소', address2 상세주소 from tb_user;

#limit
select * from tb_user limit 2; #처음부터 2개
select * from tb_user limit 1,2; #1번째(2행) 부터 2개

select * from tb_user;

create table tb_profile(
	useridx int not null,
    userage int,
    userbirthday varchar(300),
    userblood varchar(10),
    constraint profile_user_fk foreign key(useridx) references tb_user(useridx)
);

#외래키 제약조건 위배
insert into tb_profile values(10000, 100, '1923-12-13', 'O형');

insert into tb_profile values(1, 10, '2013-07-18', 'A형');
insert into tb_profile values(3, 30, '1993-04-01', 'O형');

select * from tb_profile;

#join
#데이터베이스 내의 여러 테이블에서 가져온 레코드를 조합해서 하나의 테이블이나 결과 집합으로 표현
#inner join : 조건이 일치하는 것만 결과로 생성, default
select 
	u.username,
	p.userage,
    p.userbirthday,
    p.userblood
from tb_profile p
	join tb_user u on p.useridx = u.useridx;

#outerjoin : 조건이 일치하지 않더라도 한쪽 테이블의 데이터는 모두 결과로 생성 (모든 데이터를 사용할 테이블의 방향을 적어준다)
select
	u.username,
    p.userage,
    p.userbirthday,
    p.userblood
from tb_profile p
	right outer join tb_user u on p.useridx = u.useridx;