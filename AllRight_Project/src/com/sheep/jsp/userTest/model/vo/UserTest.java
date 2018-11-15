package com.sheep.jsp.userTest.model.vo;

public class UserTest {

	private int tNo;
	private int lNo;

	// 생성자

	public UserTest() {
		super();
	}

	public UserTest(int tNo, int lNo) {
		super();
		this.tNo = tNo;
		this.lNo = lNo;
	}

	// getter & setter

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	
	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	// toString()

	@Override
	public String toString() {
		return "UserTest [tNo=" + tNo + ",  lNo=" + lNo + "]";
	}

	// hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + lNo;
		result = prime * result + tNo;
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
		UserTest other = (UserTest) obj;
		if (lNo != other.lNo)
			return false;
		if (tNo != other.tNo)
			return false;
		return true;
	}

}
