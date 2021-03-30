drop table goods;
drop table menu_item;
drop table menu_photo;
drop table menu;
drop table today;
drop table burger_order;
drop table notice_photo;
drop table notice;
drop table member;
drop table received_item;
drop table purchase_item;
drop table purchase;
drop table stock;
drop table item;
drop table branch;
drop table supervisor;

create table supervisor(
super_no number primary key,
super_id  varchar2(20) unique not null,
super_pw varchar2(15) not null
);
create sequence super_seq;

create table branch(
branch_no number primary key,
super_no number REFERENCES supervisor(super_no),
branch_name varchar2(30) not null,
branch_id varchar2(20) unique not null,
branch_pw varchar2(15) not null
);
create sequence branch_seq;


create table item(
item_no number primary key,
item_name varchar2(60) unique not null,
item_price number not null,
category varchar2(30) check
    (category in('소모품', '채소류', '육류', '제과류', '음료')) not null
);
create sequence item_seq;

create table stock(
stock_no number primary key,
branch_no number references branch(branch_no),
super_no number references supervisor(super_no),
item_no number references item(item_no),
stock_count number default 0 not null
);
create sequence stock_seq;


create table purchase (
purchase_no number primary key,
branch_no number references branch(branch_no),
super_no number references supervisor(super_no),
purchase_date date default sysdate not null,
status varchar2(30) check 
    (status in('발주대기','발주완료','발주취소','발주보류'))
);
create sequence purchase_seq;


create table purchase_item(
pi_no number primary key,
purchase_no references purchase(purchase_no),
branch_no number references branch(branch_no),
super_no number references supervisor(super_no),
item_no number references item(item_no),
count number default 0 not null
);
create sequence pi_seq;


create table received_item(
receive_no number primary key,
purchase_no references purchase(purchase_no),
branch_no number references branch(branch_no),
item_no number references item(item_no),
count number default 0 not null,
receive_date date default sysdate not null
);
create sequence receive_seq;


create table member(
member_no number primary key,
member_id varchar2(20) not null unique,
member_pw varchar2(15) not null,
member_name varchar2(60) not null,
member_phone varchar2(12) not null unique,
member_address varchar2(60) not null,
member_gender varchar2(12) not null,
member_age_group varchar2(5) not null
);
create sequence member_seq;


create table NOTICE(
notice_no number primary key,
super_no number references supervisor(super_no) on delete set null,
notice_title varchar2(300) not null,
notice_content varchar2(4000) not null,
notice_date date default SYSDATE
);
create sequence notice_seq;


create table NOTICE_PHOTO(
np_no number primary key,
notice_no number references notice(notice_no) on delete cascade,
super_no number references supervisor(super_no) on delete cascade,
upload_name varchar2(256) not null,
save_name varchar2(256) not null unique,
file_size number,
save_type varchar2(256) not null
);
create sequence np_seq;



create table burger_order( -- 주문
order_no number primary key, -- 주문번호
member_no references member(member_no), -- 멤버 외래키
branch_no references branch(branch_no) -- 지점 외래키
);

create sequence order_seq;


create table today ( -- 당일주문
dum_no number primary key, -- 당일주문 더미 번호
order_no references burger_order(order_no), -- 주문 외래키
branch_no references branch(branch_no), -- 지점 외래키
today_num number default 1 not null, -- 당일 대기 번호
today_time timestamp default sysdate, -- 거래시간
total_price number not null, -- 총금액
status char(1) default '0', -- 0이면 주문접수, 1이면 픽업완료
price_status char(1) default '0' -- 0이면 만나서 결제, 1이면 결제API
);
create sequence today_seq;

create table menu(
    menu_no number primary key,
    menu_name varchar2(60) not null unique,
    menu_price number default 0 not null,
    menu_kcal number default 0 not null,
    menu_etc varchar2(2000) not null
);
create sequence menu_seq;


create table menu_photo(
    photo_no number primary key,
    menu_no references menu(menu_no) on delete cascade,
    upload_name varchar2(256) not null,
    save_name varchar2(256) not null unique,
    file_size number default 0 not null,
    save_type varchar2(256) not null
);
create sequence menu_photo_seq;

create table menu_item(
    mi_no number primary key,
    menu_no references menu(menu_no) on delete cascade,
    item_no references item(item_no) on delete cascade,
    branch_no references branch(branch_no) on delete cascade
);
create sequence mi_seq;


create table goods ( -- 주문상품
goods_no number primary key, -- 상품번호
order_no references burger_order(order_no), -- 주문 외래키
member_no references member(member_no), -- 멤버 외래키
menu_no references menu(menu_no), -- 메뉴 외래키
branch_no references branch(branch_no), -- 지점 외래키
count number not null
);
create sequence goods_seq;


