package com.ssafy.happyhouse.domain;

public class MemberDto {


	// 아이디 
	private String id;
	// 비밀번호 
	private String password;
	// 이름 
	private String name;
	// 기본주소 
	private String address_default;
	// 휴대폰전화번호 
	private String phoneNum;
	// 상세주소 
	private String address_detail;
	// 우편번호 
	private String postNum;
	// 집전화번호 
	private String homeNum;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress_default() {
		return address_default;
	}
	public void setAddress_default(String address_default) {
		this.address_default = address_default;
	}
	public String getPhoneNum() {
		return phoneNum;
	}
	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	public String getAddress_detail() {
		return address_detail;
	}
	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}
	public String getPostNum() {
		return postNum;
	}
	public void setPostNum(String postNum) {
		this.postNum = postNum;
	}
	public String getHomeNum() {
		return homeNum;
	}
	public void setHomeNum(String homeNum) {
		this.homeNum = homeNum;
	}
	
	


	

}