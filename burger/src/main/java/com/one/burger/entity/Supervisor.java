package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Supervisor {
	private int super_no;
	private String super_id;
	private String super_pw;
}

/*
 create table supervisor(
super_no number primary key,
super_id  varchar2(20) unique not null,
super_pw varchar2(15) not null
);
create sequence super_seq;
 */
