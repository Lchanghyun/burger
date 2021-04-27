package com.one.burger.entity;

public class Notice_Photo {
	private int np_no;
	private int notice_no;
	private int super_no;
	private String upload_name;
	private String save_name;
	private long file_size;
	private String save_type;
}

/*
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
 */
