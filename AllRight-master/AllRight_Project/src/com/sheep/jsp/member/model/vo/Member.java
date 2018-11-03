package com.sheep.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	

	private static final long serialVersionUID = 10000L;

	
	// 필드
	
	private int a;
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String seloption;
	private Date enrollDate;
	private int point;
	
	
	
	// 생성자
	
	public Member() {
		super();
	}


	public Member(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}


	public Member(int userNo, String userId, String userPwd, String userName, String email, String seloption) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.seloption = seloption;
	}


	public Member(int userNo, String userId, String userPwd, String userName, String email, String seloption,
			Date enrollDate ,int point) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.seloption = seloption;
		this.enrollDate = enrollDate;
		this.point = point;
	}

	
	
	
	// getter & setter 

	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getUserPwd() {
		return userPwd;
	}


	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getSeloption() {
		return seloption;
	}


	public void setSeloption(String seloption) {
		this.seloption = seloption;
	}


	public Date getEnrollDate() {
		return enrollDate;
	}


	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	
	public int getPoint(){
		return point;
	}
	
	public void setPoint(int point){
		this.point = point;
	}
	


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	


	
	// toString()
	
	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", seloption=" + seloption + ", enrollDate=" + enrollDate + ", point=" + point + "]";
	}

	
	
	
	
	
}
