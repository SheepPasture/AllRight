package com.sheep.jsp.userAnswer.model.vo;

import java.util.List;

public class UserAnswer {
	
	private int tNo;
	private int userNo;
	private int qNo;
	private int userAnswer;
	private String aCheck;
	
	
	// 생성자
	
	public UserAnswer() {
		super();
	}
	
	
	public UserAnswer(int tNo, int userNo, int qNo, int userAnswer, String aCheck) {
		super();
		this.tNo = tNo;
		this.userNo = userNo;
		this.qNo = qNo;
		this.userAnswer = userAnswer;
		this.aCheck = aCheck;
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
	public int getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(int userAnswer) {
		this.userAnswer = userAnswer;
	}
	public String getaCheck() {
		return aCheck;
	}
	public void setaCheck(String aCheck) {
		this.aCheck = aCheck;
	}
	
	
	// toString()
	
	
	@Override
	public String toString() {
		return "UserAnswer [tNo=" + tNo + ", userNo=" + userNo + ", qNo=" + qNo + ", userAnswer=" + userAnswer
				+ ", aCheck=" + aCheck + "]";
	}
	
	
	// hashCode()
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((aCheck == null) ? 0 : aCheck.hashCode());
		result = prime * result + qNo;
		result = prime * result + tNo;
		result = prime * result + userAnswer;
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
		UserAnswer other = (UserAnswer) obj;
		if (aCheck == null) {
			if (other.aCheck != null)
				return false;
		} else if (!aCheck.equals(other.aCheck))
			return false;
		if (qNo != other.qNo)
			return false;
		if (tNo != other.tNo)
			return false;
		if (userAnswer != other.userAnswer)
			return false;
		if (userNo != other.userNo)
			return false;
		return true;
	}


	
	

	
	
}
