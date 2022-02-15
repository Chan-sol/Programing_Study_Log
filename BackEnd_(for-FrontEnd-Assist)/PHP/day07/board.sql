create table tb_board(
    boardidx bigint auto_increment primary key,
    boardtitle varchar(1000) not null,
    boardcontents text,
    userid varchar(300) not null,
    boardhit int default 0,
    boardregdate datetime default now(),
    boardlike int default 0,
    constraint board_user_fk foreign key(userid) references tb_user(userid)
);

insert into tb_board (boardtitle, userid, boardcontent)
values('apple이 쓴 게시글','apple','테스트 내용1 입니다.');
insert into tb_board (boardtitle, userid, boardcontent)
values('banana가 쓴 게시글','banana','테스트 내용2 입니다.');
insert into tb_board (boardtitle, userid, boardcontent)
values('cherry가 쓴 게시글','cherry','테스트 내용3 입니다.');

insert into tb_board (boardtitle,boardcontent,userid)
(select boardtitle,boardcontent,userid from tb_board);

create table tb_reply(
	replyidx bigint primary key auto_increment,
    userid varchar(300) not null, # fk로 걸어줘야 함, 생략
    replycontent varchar(2000) not null,
    replyregdate datetime default now(),
    boardidx bigint # fk로 걸어줘야 함, 생략
);