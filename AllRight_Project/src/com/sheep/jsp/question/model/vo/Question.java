package com.sheep.jsp.question.model.vo;

import java.util.List;

import com.sheep.jsp.userTest.model.vo.UserTest;

public class Question {
	private int tNo;  // 시험번호
	private int qNo;  // 문제번호
	private String qContent; // 문제 내용
	private String qPre;  // 문제 보기 (1번, 2번)
	private int qAnswer; // 문제 정답
	
	public Question(){
		super();
	}
	
	public Question(int tNo, int qNo, String qContent, String qPre, int qAnswer){
		super();
		this.tNo = tNo;
		this.qNo = qNo;
		this.qContent = qContent;
		this.qPre = qPre;
		this.qAnswer = qAnswer;
	}

	public int gettNo() {
		return tNo;
	}

	public void settNo(int tNo) {
		this.tNo = tNo;
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

	public String getqPre() {
		return qPre;
	}

	public void setqPre(String qPre) {
		this.qPre = qPre;
	}

	public int getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(int qAnswer) {
		this.qAnswer = qAnswer;
	}

	@Override
	public String toString() {
		return "Question [tNo=" + tNo + ", qNo=" + qNo + ", qContent=" + qContent + ", qPre=" + qPre + ", qAnswer="
				+ qAnswer + "]";
	}
	
	// hasCode
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + qNo;
		return result;
	}

	public List<UserTest> getQList() {
		// TODO Auto-generated method stub
		return null;
	}

	

}
