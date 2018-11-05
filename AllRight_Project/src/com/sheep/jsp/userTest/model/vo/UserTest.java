package com.sheep.jsp.userTest.model.vo;

public class UserTest {

	private int tNo;
	private int userNo;
	private int qNo;
	private String qContent;
	private int qPre;
	private int qAnswer;
	private int lNo;

	// 생성자

	public UserTest() {
		super();
	}

	public UserTest(int tNo, int userNo, int qNo, String qContent, int qPre, int qAnswer, int lNo) {
		super();
		this.tNo = tNo;
		this.userNo = userNo;
		this.qNo = qNo;
		this.qContent = qContent;
		this.qPre = qPre;
		this.qAnswer = qAnswer;
		this.lNo = lNo;
	}

	// getter & setter

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public int getqPre() {
		return qPre;
	}

	public void setqPre(int qPre) {
		this.qPre = qPre;
	}

	public int getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(int qAnswer) {
		this.qAnswer = qAnswer;
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
		return "UserTest [tNo=" + tNo + ", userNo=" + userNo + ", qNo=" + qNo + ", qContent=" + qContent + ", qPre="
				+ qPre + ", qAnswer=" + qAnswer + ", lNo=" + lNo + "]";
	}

	// hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + lNo;
		result = prime * result + qAnswer;
		result = prime * result + ((qContent == null) ? 0 : qContent.hashCode());
		result = prime * result + qNo;
		result = prime * result + qPre;
		result = prime * result + tNo;
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
		UserTest other = (UserTest) obj;
		if (lNo != other.lNo)
			return false;
		if (qAnswer != other.qAnswer)
			return false;
		if (qContent == null) {
			if (other.qContent != null)
				return false;
		} else if (!qContent.equals(other.qContent))
			return false;
		if (qNo != other.qNo)
			return false;
		if (qPre != other.qPre)
			return false;
		if (tNo != other.tNo)
			return false;
		if (userNo != other.userNo)
			return false;
		return true;
	}

}
