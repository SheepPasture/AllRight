package com.sheep.jsp.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{

	

	private static final long serialVersionUID = 10000L;

	
	// 필드
	
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String userLeave;
	private Date userDate;
	
	
	// 생성자
	
	public Member() {
		super();
	}
	
	public Member(String userId, String userPwd){
	
		super();
		
		this.userId = userId;
		this.userPwd = userPwd;
	}


	public Member(String userId, String userPwd, String userName, String email) {
		super();
		
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
	}


	public Member(int userNo, String userId, String userPwd, String userName, String email, String userLeave,
			Date userDate) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.email = email;
		this.userLeave = userLeave;
		this.userDate = userDate;
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


	public String getUserLeave() {
		return userLeave;
	}


	public void setUserLeave(String userLeave) {
		this.userLeave = userLeave;
	}


	public Date getUserDate() {
		return userDate;
	}


	public void setUserDate(Date userDate) {
		this.userDate = userDate;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	// toString()

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", email=" + email + ", userLeave=" + userLeave + ", userDate=" + userDate + "]";
	}

	
	// hashCode()

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((userDate == null) ? 0 : userDate.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((userLeave == null) ? 0 : userLeave.hashCode());
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + userNo;
		result = prime * result + ((userPwd == null) ? 0 : userPwd.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Member other = (Member) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (userDate == null) {
			if (other.userDate != null)
				return false;
		} else if (!userDate.equals(other.userDate))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userLeave == null) {
			if (other.userLeave != null)
				return false;
		} else if (!userLeave.equals(other.userLeave))
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userNo != other.userNo)
			return false;
		if (userPwd == null) {
			if (other.userPwd != null)
				return false;
		} else if (!userPwd.equals(other.userPwd))
			return false;
		return true;
	}
	
	
	
	
	
}
