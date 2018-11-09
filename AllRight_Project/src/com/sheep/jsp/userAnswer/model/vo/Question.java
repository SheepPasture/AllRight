package com.sheep.jsp.userAnswer.model.vo;

import java.io.Serializable;

public class Question implements Serializable {
	private int qNo;
	private String qContent;
	private String qPre;
	private int qAnswer;
	
	public Question(){}
	
	public Question(int qNo, String qContent, String qPre, int qAnswer){
		super();
		this.qNo = qNo;
		this.qContent = qContent;
		this.qPre = qPre;
		this.qAnswer = qAnswer;
		
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
		return "Question [qNo=" + qNo + ", qContent=" + qContent + ", qPre=" + qPre + ", qAnswer=" + qAnswer + "]";
	}
	
	

}
