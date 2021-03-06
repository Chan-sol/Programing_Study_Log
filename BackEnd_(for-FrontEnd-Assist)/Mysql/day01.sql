#데이터베이스 생성
#create database 데이터베이스명;
create database frontend;

#데이터베이스 삭제
#drop database 데이터베이스명;
drop database frontend;

#데이터베이스 사용
#use 데이터베이스명;
use frontend;

#테이블
#데이터를 행과 열로 스키마에 따라 저장할 수 있는 구조

#스키마
#데이터베이스의 구조와 제약 조건에 관한 명세를 기술한 집합

#★☆★☆★☆★☆★☆ 본 수업에서 {}의 의미는 안에 있는 것은 생략 가능하다는 뜻이다. ★☆★☆★☆★☆★☆

#CRUD(Create, Read, Update, Delete)

#DDL(Data Definition Language) - 데이터 정의어
#테이블 생성
#create table 테이블명(컬럼명1 자료형 {제약조건}, 컬럼명2 자료형 {제약조건}, ...);

#자료형

#숫자 타입
#정수 : tinyint smallint mediumint int bigint
#실수 : float, double, decimal(n,m)
	#decimal(n,m) : 전체 n자리 중에 소수점 아래로 m자리
    #ex) decimal(4,2) ------> -99.99 ~ 99.99

#문자 타입
#텍스트 : char, varchar, text - 그냥 varchar 쓰자
	#char(20) -> 총 20byte 크기로 공간을 할당 -> 더 작은 데이터를 넣어도 공간을 소모
	#[A          ]
    #varchar(20) -> 총 20byte의 가변형 크기를 할당 -> 더 작은 데이터를 넣으면 공간 축소 (~65535byte)
    #[A]
#바이너리 : binary, varbinary
#열거 : enum(값1, 값2, ...) -> 정해놓은 값들을 제외하고는 데이터가 들어올 수 없는 타입

#날짜와 시간 타입
#날짜 : date
#날짜와 시간타입 : datetime, timestamp(1970년 1월 1일 0시 0분 0초 ~ , 몇 초 흘렀는지 저장됨)

create table car(
	carnum int,
	brand varchar(300),
    color varchar(300),
    price int
);

drop table car;

#제약조건
#데이터의 무결성을 지키기 위해 데이터를 입력받을 때 실행하는 검사 규칙
#not null		비어있을 수 없음(NULL을 저장할 수 없음)
#unique			고유한 값(중복된 값을 저장할 수 없음, NULL은 허용)
#default		기본값을 설정
#primary key	고유하면서 비어있을 수 없는 값을 설정, 
#				unique, not null 제약 조건을 동시에 가짐
#				테이블에 오직 하나의 필드에만 적용
#auto_increment 자동으로 숫자가 하나씩 증가되며 추가, 중복된 값이 저장되지 않음
#foreign key	다른 테이블과 연결해주는 역할, pk 참조(나중에)

create table tb_user(
	useridx int primary key auto_increment,
	userid varchar(300) unique not null,
    userpw varchar(300) not null,
    username varchar(300) not null,
    userphone varchar(300) not null,
    useremail varchar(300),
    userhobby varchar(1000),
    zipcode varchar(300) not null,
    address1 varchar(300),
    address2 varchar(1000) not null,
    address3 varchar(300),
    regdate datetime default now() #default : 제약조건, now() : 내장함수
);

#테이블 구조 확인
desc tb_user;

#테이블 컬럼 추가
#alter table 테이블명 add (컬럼명 자료형 {제약조건});
alter table tb_user add (userpoint int default 0);

#테이블 컬럼 수정
#alter table 테이블명 modify column (컬럼명 자료형 {제약조건});
alter table tb_user modify column userpoint double default 0;

#테이블 컬럼 삭제
#alter table 테이블명 drop 컬럼명;
alter table tb_user drop userpoint;