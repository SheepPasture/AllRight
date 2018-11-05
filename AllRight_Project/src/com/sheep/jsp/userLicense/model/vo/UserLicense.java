package com.sheep.jsp.userLicense.model.vo;

public class UserLicense {

	private int lNo;
	private int userNo;

	// 생성자

	public UserLicense() {
		super();
	}

	public UserLicense(int lNo, int userNo) {
		super();
		this.lNo = lNo;
		this.userNo = userNo;
	}

	// getter & setter

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	// toString()
	@Override
	public String toString() {
		return "UserLicense [lNo=" + lNo + ", userNo=" + userNo + "]";
	}

	// hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + lNo;
		result = prime * result + userNo;
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
		UserLicense other = (UserLicense) obj;
		if (lNo != other.lNo)
			return false;
		if (userNo != other.userNo)
			return false;
		return true;
	}

}
