package com.one.burger.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//공지사항 entity
public class Notice {
	private int notice_no;
	private int super_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
}
/*
 notice_no number primary key,
super_no number references supervisor(super_no) on delete set null,
notice_title varchar2(300) not null,
notice_content varchar2(4000) not null,
notice_date date default SYSDATE
);
create sequence notice_seq;
 */

