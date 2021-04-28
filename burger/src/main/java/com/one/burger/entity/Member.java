package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//회원 entity
public class Member {
	private int member_no;
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_phone;
	private String member_address;
	private String member_gender;
	private String member_age_group;
}
/*
 create table member(
member_no number primary key,
member_id varchar2(20) not null unique,
member_pw varchar2(15) not null,
member_name varchar2(60) not null,
member_phone varchar2(12) not null unique,
member_address varchar2(150) not null,
member_gender varchar2(12) check
    (member_gender in ('남', '여', '선택안함')),
member_age_group varchar2(11) check
    (member_age_group in ('10대', '20대', '30대', '40대', '50대이상'))
);

create sequence member_seq;
*/