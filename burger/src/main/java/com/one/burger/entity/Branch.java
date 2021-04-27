package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Branch {
	private int branch_no;
	private int super_no;
	private String branch_name;
	private String branch_id;
	private String branch_pw;
}

/*
 create table branch(
branch_no number primary key,
super_no number REFERENCES supervisor(super_no),
branch_name varchar2(30) not null,
branch_id varchar2(20) unique not null,
branch_pw varchar2(15) not null
);
create sequence branch_seq;
 */
