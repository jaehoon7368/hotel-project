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
    hotel_name varchar2(50),
    hotel_address varchar2(100),
    hotel_type char not null,
    hotel_info varchar2(4000),
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
    room_info varchar2(4000),
    constraint pk_tb_room_no primary key (room_no),
    constraint fk_tb_room_tb_hotel_no foreign key (hotel_no) references tb_hotel(hotel_no)
);

ALTER TABLE tb_room MODIFY hotel_no varchar2(20);

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
    content varchar2(4000),
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
create sequence seq_hotel_comment_no;
create sequence req_hotel_image_no;
create sequence req_room_no;
create sequence req_room_image_no;

insert into tb_category values ('c011','에어컨');
insert into tb_category values ('c012','피트니스센터');
insert into tb_category values ('c013','세탁기');
insert into tb_category values ('c014','주방');
insert into tb_category values ('c015','데스크톱');
insert into tb_category values ('c016','와이파이');
insert into tb_category values ('c017','데스크톱');


insert into tb_category values('c01','넷플릭스');
insert into tb_category values('c02','주방');
insert into tb_category values('c03','주차장');
insert into tb_category values('c04','수영장');
insert into tb_category values('c05','해변');
insert into tb_category values('c06','온천');
insert into tb_category values('c07','루프탑');
insert into tb_category values('c08','오션뷰');
insert into tb_category values('c09','반려동물');

insert into tb_user values('0','user','1234','일반인','01012341234','U','users@naver.com','고객이올시다',default);
select * from tb_user;
select * from tb_hotel;
select * from tb_hotel_image;
select * from tb_room;
select * from tb_hotel_category;
select * from tb_hotel_comment;
select * from tb_reservation;

ALTER TABLE tb_user ADD enroll_date date default sysdate;

select * from tb_hotel where hotel_type='H';
select h.*,(select min(room_price) from tb_room r where r.hotel_no = h.hotel_no group by hotel_no) price,(select renamed_filename from tb_hotel_image i where i.hotel_no = h.hotel_no) renamed_filename from tb_hotel h where h.hotel_type='H';

