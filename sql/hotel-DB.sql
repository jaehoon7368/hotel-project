---------------------------------------------------여기어때 오라클
alter session set "_oracle_script"=true; --c## 접두어 없이 계정 생성 

create user wow
identified by wow
default tablespace users;

alter user wow quota unlimited on users;

grant connect, resource to wow;



create table tb_user (
    user_no number,
    user_id varchar(15),
    password varchar(300) not null,
    user_name varchar(10) not null,
    phone varchar(15) not null,
    user_role char default 'U',
    email varchar2(30) not null,
    nick_name varchar(20),
    user_status char  default 'N',
    constraint pk_tb_user_id primary key (user_id),
    constraint ck_tb_user_role check(user_role in ('A','U','S'))
);
create table tb_hotel(
    hotel_no varchar2(10),
    hotel_name varchar2(20),
    hotel_address varchar2(50),
    hotel_type char not null,
    hotel_info long ,
    user_id varchar2(15) ,
    constraint pk_tb_hotel_no primary key (hotel_no),
    constraint fk_tb_hotel_tb_user_id foreign key (user_id) references tb_user(user_id),
    constraint ck_tb_hotel_type check (hotel_type in ('H','Y','P'))
);

create table tb_room(
    room_no varchar2(10),
    room_type  varchar2(100) not null,
    room_price number not null,
    limit_people number default 2,
    hotel_no varchar2(10),
    constraint pk_tb_room_no primary key (room_no),
    constraint fk_tb_room_tb_hotel_no foreign key (hotel_no) references tb_hotel(hotel_no)
);

alter table tb_room add room_info long;

create table tb_reservation(
    re_no varchar(10),
    people_num number default 1,
    start_date date not null,
    end_date date  not null,
    reservation_status char ,    --예약여부 
    room_no varchar2(10) ,   --fk  hotel 넘버
    user_id varchar2(15) ,  -- fk user 넘버
    hotel_no varchar2(10),  -- fk  호텔 넘버
    constraint pk_tb_re_no primary key (re_no),
    constraint fk_tb_reservation_tb_room_no foreign key (room_no) references tb_hotel(hotel_no),
    constraint fk_tb_reservation_tb_user_id foreign key (user_id) references tb_user(user_id)
);

create table tb_sales_data(
    sales_no varchar2(10),
    total_price number ,
    reg_date date not null,
    re_no varchar2(10) ,
    user_id varchar2(15),
    constraint pk_tb_sales_data primary key (sales_no), 
    constraint fk_tb_sales_data_tb_reservation foreign key (re_no) references tb_reservation(re_no),   
    constraint fk_tb_sales_date_tb_user foreign key (user_id) references tb_user(user_id)
);

create table tb_board (
    board_no varchar2(10),
    title varchar2(300) not null,
    content long ,
    category varchar2(50)  null,
    type varchar2(50) null,
    phone varchar2(15),
    email varchar2(50),
    reg_date date default sysdate,
    user_id varchar2(15),
    constraint pk_tb_board primary key (board_no),
    constraint fk_tb_board_tb_user foreign key (user_id) references tb_user(user_id)
);
create table tb_board_comment(
    comment_no varchar2(10),
    content varchar2(2000),
    reg_date date default sysdate,
    comment_level number ,
    board_no varchar2(10),
    user_id varchar2(15),
    constraint pk_tb_board_comment primary key (comment_no),
    constraint fk_tb_board_comment_tb_board foreign key (board_no) references tb_board(board_no),
    constraint fk_tb_board_comment_tb_user foreign key (user_id) references tb_user(user_id)
);

create table tb_hotel_comment(
    comment_no number,
    comment_level number default 1,
    content varchar2(2000),
    comment_ref number,
    reg_date date default sysdate,
    hotel_no varchar2(10),
    user_id varchar2(15),
    constraint pk_tb_hotel_comment primary key (comment_no),
    constraint fk_tb_hotel_comment_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no),
    constraint fk_tb_hotel_comment_tb_user foreign key (user_id) references tb_user(user_id)
);
create table tb_category(
    category_no varchar2(10),
    category_name varchar2(20),
    constraint pk_tb_category  primary key (category_no) 
);
create table tb_hotel_category(
    category_no varchar2(10),
    hotel_no varchar2(10),
    user_id varchar2(15),
    constraint fk_tb_hotel_category_tb_category foreign key (category_no) references tb_category(category_no),
    constraint fk_tb_hotel_category_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no),
    constraint fk_tb_hotel_category_tb_user foreign key (user_id) references tb_user(user_id)
);

create table tb_hotel_image(
    image_no number,
    original_filename varchar2(300),
    renamed_filename varchar2(300),
    enroll_date date default sysdate,
    hotel_no varchar2(10),
    constraint pk_tb_hotel_image primary key (image_no),
    constraint fk_tb_hotel_image_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no)    
);
create table tb_room_image(
    image_no number,
    original_filename varchar2(300),
    renamed_filename varchar2(300),
    enroll_date date default sysdate,
    room_no varchar2(10),
    constraint pk_tb_room_image primary key (image_no),
    constraint fk_tb_room_image foreign key (room_no) references tb_room(room_no)
);

create sequence req_user_no ;
create sequence req_hotel_no ;

insert into tb_user values('1','admin','1234','홍길동','01012341234','A','honggd@naver.com','길동이올시다',default);
insert into tb_user values('2','user','1234','일반인','01012341234','U','users@naver.com','고객이올시다',default);
insert into tb_hotel values('H001','호텔컨포지엄','서울시 강남구 논현동 24-5','H','ONDA는 다양한 숙박업소분들과 함께 일하는 팀입니다. 한국의 각 지역의 멋진 숙박업소를 찾아 고객님께 연결해주는 일을 하고 있습니다. 업무시간은 한국시간으로 10:00~18:00입니다. 예약이 완료 되시면 ONDA로 예약확정 문자를 드립니다.','admin');
insert into tb_hotel values('P002','펜션이더리움','강원도 속초시 속초리 24-5','P','우리는 함께하는 팀입니다. 화이팅입니다.','admin');
insert into tb_room values ('HR001','스위트룸',300000,default,'H001');
insert into tb_room values ('HR002','디럭스싱글',120000,default,'H001');
insert into tb_room values ('HR003','디럭스',120000,default,'H001');
insert into tb_room values ('HR004','럭셔리스위트',300000,default,'H001');
insert into tb_room values ('PR005','ider101',120000,default,'P002');
insert into tb_room values ('PR006','ider201',150000,default,'P002');
insert into tb_room values ('PR007','ider301',150000,default,'P002');
insert into tb_room values ('PR008','ider303',170000,default,'P002');

insert into tb_category values('c01','넷플릭스');
insert into tb_category values('c02','주방');
insert into tb_category values('c03','주차장');
insert into tb_category values('c04','수영장');
insert into tb_category values('c05','해변');
insert into tb_category values('c06','온천');
insert into tb_category values('c07','루프탑');
insert into tb_category values('c08','오션뷰');
insert into tb_category values('c09','반려동물');

insert into tb_hotel_category values('c01','H001','admin');
insert into tb_hotel_category values('c07','H001','admin');
insert into tb_hotel_category values('c04','H001','admin');
insert into tb_hotel_category values('c03','P002','admin');
insert into tb_hotel_category values('c08','P002','admin');
insert into tb_hotel_category values('c09','P002','admin');
select* from tb_room;

insert into tb_reservation values ('R0101',default,'2023-01-05','2023-01-06',default,'HR001','user','H001');
insert into tb_reservation values ('R0102',default,'2022-12-31','2023-01-01',default,'HR001','user','H001');
insert into tb_reservation values ('R0103',default,'2022-05-07','2022-05-10',default,'HR001','user','H001');

insert into tb_sales_data values ('P0101',300000,'2023-01-01','R0101','user');

insert into tb_board values('B0101','게시판만들어주세요','게시판내용은 길게길겔에에에에~~~~~~~~~~~~~~~~~~~~~~쓸거에요 !','카테고리','예약취소','01012341234','honggd@naver.com',default,'user');
insert into tb_board_comment values('BC0101',' 문의사항남깁니다 .. ps.user ',default,default,'B0101','user');

insert into tb_hotel_image values(1,'호텔1.png','20220418_125936088_36.png',default,'H001');
insert into tb_room_image values(1,'룸1.png','20220418_125936088_35.png',default,'HR001');
insert into tb_room_image values(2,'룸2.png','20220418_125936088_31.png',default,'HR002');
insert into tb_room_image values(3,'룸3.png','20220418_125936088_32.png',default,'HR003');
insert into tb_room_image values(4,'룸4.png','20220418_125936088_33.png',default,'HR004');

insert into tb_hotel_image values(2,'펜션1.png','20220418_125936088_37.png',default,'P002');
insert into tb_room_image values(5,'룸1.png','20220418_125936088_38.png',default,'PR005');
insert into tb_room_image values(6,'룸1.png','20220418_125936088_39.png',default,'PR006');
insert into tb_room_image values(7,'룸1.png','20220418_125936088_40.png',default,'PR007');
insert into tb_room_image values(8,'룸1.png','20220418_125936088_41.png',default,'PR008');

select * from tb_room_image;
select * from tb_hotel_image;
select * from tb_hotel;
select * from tb_room;
select * from tb_user;
select * from tb_hotel_category;
select * from tb_category;
select * from tb_hotel_comment;
select * from tb_reservation;
select * from tb_board_comment;
select * from tb_board;
select * from tb_sales_data;

-- alter table tb_hotel_comment add comment_ref number;

ALTER TABLE tb_hotel_comment MODIFY comment_no number;


--select r.*,(select renamed_filename from tb_room_image i where i.room_no = r.room_no) renamed_filename from tb_room r where hotel_no = 'H001' order by room_price asc;

--select h.*,(select min(room_price) from tb_room r where r.hotel_no = h.hotel_no group by hotel_no) price,(select renamed_filename from tb_hotel_image i where i.hotel_no = h.hotel_no) renamed_filename from tb_hotel h;

--select h.*,(select renamed_filename from tb_hotel_image i where i.hotel_no = h.hotel_no) renamed_filename from tb_hotel h where hotel_no = 'H001';

--update tb_hotel set hotel_address = '서울시 강남구 논현동 24-6' where hotel_no = 'H001';
--update tb_hotel set hotel_address = '강원 속초시 중앙동 468-121' where hotel_no = 'P002';

create sequence seq_hotel_comment_no;

insert into tb_hotel_comment values(seq_hotel_comment_no.nextval, default, '멋진 숙소네요.',null, default, 'H001', 'user');
insert into tb_hotel_comment values(seq_hotel_comment_no.nextval, default, '다시오고싶어요~!.',null, default, 'H001', 'admin');
-- 대댓글
insert into tb_hotel_comment values(seq_hotel_comment_no.nextval, 2, '또오세용.',1, default, 'H001', 'user');
insert into tb_hotel_comment values(seq_hotel_comment_no.nextval, 2, '또 방문할게요~.',1, default, 'H001', 'admin');
insert into tb_hotel_comment values(seq_hotel_comment_no.nextval, 2, '또오세용!!!.',2, default, 'H001', 'user');


--drop table tb_hotel_comment;

create table tb_hotel_comment(
    comment_no number,
    comment_level number default 1,
    content varchar2(2000),
    comment_ref number,
    reg_date date default sysdate,
    hotel_no varchar2(10),
    user_id varchar2(15),
    constraint pk_tb_hotel_comment primary key (comment_no),
    constraint fk_tb_hotel_comment_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no),
    constraint fk_tb_hotel_comment_tb_user foreign key (user_id) references tb_user(user_id)
);


--select * from tb_hotel_comment where hotel_no = 'H001' start with comment_level = 1 connect by prior comment_no = comment_ref order siblings by comment_no asc;










