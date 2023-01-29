--drop table tb_hotel_image;
--drop table tb_room_image;
--drop table tb_hotel_category;
--drop table tb_category;
--drop table tb_hotel_comment;
--drop table tb_reservation;
--drop table tb_user;
--delete from tb_room;
--drop table tb_room;
--delete from tb_hotel;
--drop table tb_hotel;
--delete from tb_sales_data;
--drop table tb_sales_data;
--drop table tb_reservation;
--drop table tb_board_comment;
--select*from tb_inquiy_board_comment;
--select*from tb_inquiy_board;
--delete from tb_inquiy_board;
--select * from tb_notice_board;
--delete from tb_notice_board;
--drop table tb_notice_board;
--drop table tb_board;
--drop table tb_user;
--drop sequence req_hotel_image_no;
--drop sequence req_hotel_no;
--drop sequence req_reservation;
--drop sequence req_room_image_no;
--drop sequence req_room_no;
--drop sequence req_user_no;
--drop sequence seq_hotel_comment_no;
--drop sequence seq_inquiy_board;
--drop sequence seq_inquiy_comment;
--drop sequence seq_notice_board;

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
    enroll_date date  default sysdate,
    constraint pk_tb_user_id primary key (user_id),
    constraint ck_tb_user_role check(user_role in ('A','U','S'))
);
create table tb_hotel(
    hotel_no varchar2(10),
    hotel_name varchar2(50),
    hotel_address varchar2(100),
    hotel_type char not null,
    hotel_info varchar2(4000),
    user_id varchar2(15) ,
    constraint pk_tb_hotel_no primary key (hotel_no),
    constraint fk_tb_hotel_tb_user_id foreign key (user_id) references tb_user(user_id) on delete cascade ,
    constraint ck_tb_hotel_type check (hotel_type in ('H','Y','P'))  
);



create table tb_room(
    room_no varchar2(10),
    room_type  varchar2(100) not null,
    room_price number not null,
    limit_people number default 2,
    hotel_no varchar2(50),
    room_info varchar2(4000),
    constraint pk_tb_room_no primary key (room_no) ,
    constraint fk_tb_room_tb_hotel_no foreign key (hotel_no) references tb_hotel(hotel_no)on delete cascade 
);

create table tb_reservation(
    re_no varchar(10),
    people_num number default 2,
    start_date date not null,
    end_date date  not null,
    reservation_status char default'Y' ,    --예약여부 
    room_no varchar2(10) ,  
    user_id varchar2(15) ,  
    hotel_no varchar2(10),
    re_name varchar2(15) default '없음',
    re_day varchar2(10) default '1일',
    re_price number,
	constraint pk_tb_re_no primary key (re_no),
    constraint fk_tb_reservation_tb_room_no foreign key (room_no) references tb_room(room_no) on delete cascade ,
    constraint fk_tb_reservation_tb_user_id foreign key (user_id) references tb_user(user_id) on delete cascade ,
    constraint fk_tb_reservation_tb_hotel_no foreign key (hotel_no) references tb_hotel(hotel_no)on delete cascade 
   );

create table tb_sales_data(
    sales_no varchar2(10),
    total_price number ,
    reg_date date default sysdate,
    re_no varchar2(10) ,
    user_id varchar2(15),
    constraint pk_tb_sales_data primary key (sales_no), 
    constraint fk_tb_sales_data_tb_reservation foreign key (re_no) references tb_reservation(re_no) on delete cascade ,   
    constraint fk_tb_sales_date_tb_user foreign key (user_id) references tb_user(user_id) on delete cascade 
);

create table tb_board (
    board_no varchar2(10),
    title varchar2(300) not null,
    content varchar2(4000),
    category varchar2(50)  null,
    type varchar2(50) null,
    phone varchar2(15),
    email varchar2(50),
    reg_date date default sysdate,
    user_id varchar2(15),
    constraint pk_tb_board primary key (board_no) ,
    constraint fk_tb_board_tb_user foreign key (user_id) references tb_user(user_id) on delete cascade 
);
create table tb_board_comment(
    comment_no varchar2(10),
    content varchar2(2000),
    reg_date date default sysdate,
    comment_level number ,
    board_no varchar2(10),
    user_id varchar2(15),
    constraint pk_tb_board_comment primary key (comment_no),
    constraint fk_tb_board_comment_tb_board foreign key (board_no) references tb_board(board_no) on delete cascade ,
    constraint fk_tb_board_comment_tb_user foreign key (user_id) references tb_user(user_id ) on delete cascade 
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
    constraint fk_tb_hotel_comment_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no) on delete cascade ,
    constraint fk_tb_hotel_comment_tb_user foreign key (user_id) references tb_user(user_id) on delete cascade 
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
    constraint fk_tb_hotel_category_tb_category foreign key (category_no) references tb_category(category_no) on delete cascade ,
    constraint fk_tb_hotel_category_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no) on delete cascade ,
    constraint fk_tb_hotel_category_tb_user foreign key (user_id) references tb_user(user_id) on delete cascade 
);

create table tb_hotel_image(
    image_no number,
    original_filename varchar2(300),
    renamed_filename varchar2(300),
    enroll_date date default sysdate,
    hotel_no varchar2(10),
    constraint pk_tb_hotel_image primary key (image_no),
    constraint fk_tb_hotel_image_tb_hotel foreign key (hotel_no) references tb_hotel(hotel_no) on delete cascade    
);


create table tb_room_image(
    image_no number,
    original_filename varchar2(300),
    renamed_filename varchar2(300),
    enroll_date date default sysdate,
    room_no varchar2(10),
    constraint pk_tb_room_image primary key (image_no),
    constraint fk_tb_room_image foreign key (room_no) references tb_room(room_no) on delete cascade 
);
--------=========-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=--==-=-=-
-------================================-=-=-=-=-=-
create table tb_notice_board (
    notice_no number,
    title varchar2(300) not null,
    reg_date date default sysdate,
    content varchar2(4000) not null,
    writer varchar2(50),
    constraint pk_tb_notice_board_no primary key (notice_no),
    constraint fk_tb_notice_board_writer foreign key(writer) references tb_user(user_id) on delete cascade
);

create table tb_inquiy_board (
    inquiy_no number,
    product_type varchar2(100),
    inquiy_type varchar2(100),
    phone varchar2(15),
    email varchar2(50),
    content varchar2(4000) not null,
    reg_date date default sysdate,
    writer varchar2(50),
    constraint pk_tb_inquiy_board_no primary key (inquiy_no),
    constraint fk_tb_inquiy_board_writer foreign key(writer) references tb_user(user_id) on delete cascade
);

create table tb_inquiy_board_comment (
    inquiy_comment_no number,
    content varchar2(4000) not null,
    reg_date date default sysdate,
    inquiy_comment_level number default 1,
    inquiy_no number,
    writer varchar2(50),
    constraint pk_tb_inquiy_board_comment_no primary key (inquiy_comment_no),
    constraint fk_tb_inquiy_board_comment_writer foreign key (writer) references tb_user (user_id) on delete cascade,
    constraint fk_tb_inquiy_board_comment_inquiy_no foreign key (inquiy_comment_no) references tb_inquiy_board (inquiy_no) on delete cascade
);


create sequence req_hotel_image_no;
create sequence req_hotel_no;
create sequence req_reservation;
create sequence req_room_image_no;
create sequence req_room_no;
create sequence req_user_no;
create sequence seq_hotel_comment_no;
create sequence seq_inquiy_board;
create sequence seq_inquiy_comment;
create sequence seq_notice_board;


insert into tb_category values('c01','넷플릭스');
insert into tb_category values('c02','주방');
insert into tb_category values('c03','주차장');
insert into tb_category values('c04','수영장');
insert into tb_category values('c05','해변');
insert into tb_category values('c06','온천');
insert into tb_category values('c07','루프탑');
insert into tb_category values('c08','오션뷰');
insert into tb_category values('c09','반려동물');
insert into tb_category values ('c011','에어컨');
insert into tb_category values ('c012','피트니스센터');
insert into tb_category values ('c013','세탁기');
insert into tb_category values ('c014','주방');
insert into tb_category values ('c015','데스크톱');
insert into tb_category values ('c016','와이파이');
insert into tb_category values ('c017','데스크톱');

insert into tb_user values('0','user','1234','일반인','01012341234','U','users@naver.com','고객이올시다',default);
select * from tb_user;
select * from tb_hotel;
select * from tb_hotel_image;
select * from tb_room;
select * from tb_hotel_category;
select * from tb_hotel_comment;
select * from tb_reservation;
select * from tb_category;

ALTER TABLE tb_user ADD enroll_date date default sysdate;

select * from tb_hotel_category where hotel_no = 'H0002' group by hotel_no;


select hotel_name, room_type, re_day, start_date, end_date, re_name, re_price from tb_reservation re join tb_room rm on re.room_no = rm.room_no join tb_hotel h on rm.hotel_no = h.hotel_no join tb_user u on re.user_id = u.user_id where re.user_id = 'honggd';
select min(room_price) min_price,max(room_price) max_price,avg(room_price) avg_price from tb_room;

select h.*,(select min(r.room_price) from tb_room r where r.hotel_no = h.hotel_no group by hotel_no) price,(select renamed_filename from tb_hotel_image i where i.hotel_no = h.hotel_no) renamed_filename from tb_hotel h where h.hotel_no in ('H0002');

select hotel_no from tb_hotel_category where category_no >= all ('c011','c016','c01') and hotel_no = any('H0002') group by hotel_no;
    
select hotel_no from tb_room r where r.room_price between 55000 and 650000 group by hotel_no;


select h.*,(select min(r.room_price) from tb_room r where r.hotel_no = h.hotel_no group by hotel_no) price,(select renamed_filename from tb_hotel_image i where i.hotel_no = h.hotel_no) renamed_filename from tb_hotel h where h.hotel_no >= any('H0002','Y0004','H0006','P0001','Y0007','P0005');

