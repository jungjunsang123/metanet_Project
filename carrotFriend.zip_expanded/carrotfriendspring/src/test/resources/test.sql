select * from post

SELECT * FROM post ORDER BY DBMS_RANDOM.RANDOM;

delete POST


     CREATE TABLE MEMBER(
   ID               VARCHAR2(100) NOT NULL,
   PASSWORD         VARCHAR2(100) NOT NULL,
   NICKNAME         VARCHAR2(100) NOT NULL,
   NAME             VARCHAR2(100) NOT NULL,
   CITYNUM          VARCHAR2(100) NOT NULL,
   PR               CLOB,
   REGISTERDATE     DATE DEFAULT sysdate,
   UPDATEDATE       DATE,
   AUTHORITY        VARCHAR2(100),
   CONSTRAINT PK_member PRIMARY KEY (ID)
);

insert into member (id,password,nickname,name,citynum) values('4','1234','nickname','name',1234)

CREATE TABLE POST(
    postNo varchar2(100) not null,
    content clob,
    writeDate DATE DEFAULT sysdate,
    image varchar2(200) not null,
    id varchar2(100) not null,
    constraint pk_post primary key(postNo),
    constraint fk_post foreign key(id) references member(id) on delete cascade
);
CREATE sequence post_seq;

CREATE TABLE follow(
    myId varchar2(20) not null,
    urNick varchar2(20) not null,
    constraint pk_follow primary key(myID, urNick),
    constraint fk_follow foreign key(myId) references member(id) on delete cascade
);

drop table follow;
drop table post;
drop table member;
drop sequence post_seq;
select * from member;
select * from follow;
select *from post;
commit

select * from (
 SELECT p.postNo , p.content, p.writedate , p.image, m.nickName, m.cityNum
 FROM post p,member m
 where m.id =p.id   ORDER BY DBMS_RANDOM.RANDOM 
)
where  rownum between 1 and 10 
INSERT INTO post(postNo,content,image,id)
		VALUES((select nvl(max(postNo),0)+1 as postNo from Post),
			#{content},#{image},#{memberDTO.id})
delete from post
 SELECT * FROM post p,member m where m.id =p.id  ORDER BY DBMS_RANDOM.RANDOM 
 

delete from member where cityNum='서울특별시'

select * from member where cityNum='부산특별시'




SELECT *
      FROM (SELECT rownum as rn, A.*
           FROM (SELECT * FROM member where cityNum='제주도' ORDER BY name asc, cityNum asc) A
           WHERE rownum <= 100)
      WHERE rn >= 1
