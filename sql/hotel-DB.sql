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
    comment_no varchar2(10),
    comment_level number,
    content varchar2(2000),
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

select h.*,(select min(room_price) from tb_room r where r.hotel_no = h.hotel_no group by hotel_no) price,(select renamed_filename from tb_hotel_image i where i.hotel_no = h.hotel_no) renamed_filename from tb_hotel h;

select r.*,(select renamed_filename from tb_room_image i where i.room_no = r.room_no) renamed_filename from tb_room r where hotel_no = 'H001' order by room_price asc;













