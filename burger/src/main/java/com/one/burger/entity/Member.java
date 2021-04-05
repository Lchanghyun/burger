package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.experimental.SuperBuilder;

@Getter
@Setter
@SuperBuilder
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
