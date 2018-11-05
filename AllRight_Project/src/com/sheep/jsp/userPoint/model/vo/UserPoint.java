package com.sheep.jsp.userPoint.model.vo;

public class UserPoint {

	private int userNo;
	private int point;
	private int totalPoint;

	// 생성자

	public UserPoint() {
		super();

	}

	public UserPoint(int userNo, int point, int totalPoint) {
		super();
		this.userNo = userNo;
		this.point = point;
		this.totalPoint = totalPoint;
	}

	// getter & setter
	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getTotalPoint() {
		return totalPoint;
	}

	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}

	// toString()
	@Override
	public String toString() {
		return "UserPoint [userNo=" + userNo + ", point=" + point + ", totalPoint=" + totalPoint + "]";
	}

	// hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + point;
		result = prime * result + totalPoint;
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
		UserPoint other = (UserPoint) obj;
		if (point != other.point)
			return false;
		if (totalPoint != other.totalPoint)
			return false;
		if (userNo != other.userNo)
			return false;
		return true;
	}

}
