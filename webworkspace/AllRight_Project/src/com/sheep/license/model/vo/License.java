package com.sheep.license.model.vo;

import java.io.Serializable;

public class License implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int lNo;			// 자격증 번호
	private String lName;		// 자격증 명
	private String lInfo;		// 자격증 정보
	private String lDate;		// 시험 일자
	private String lCategory;	// 자격증 분류
	private String lCost;		// 응시 비용
	
	public License() {}

	public License(int lNo, String lName, String lInfo, String lDate, String lCategory, String lCost) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lInfo = lInfo;
		this.lDate = lDate;
		this.lCategory = lCategory;
		this.lCost = lCost;
	}

	public License(String lName, String lCost) {
		super();
		this.lName = lName;
		this.lCost = lCost;
	}

	public License(String lName) {
		super();
		this.lName = lName;
	}

	public int getlNo() {
		return lNo;
	}

	public void setlNo(int lNo) {
		this.lNo = lNo;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public String getlInfo() {
		return lInfo;
	}

	public void setlInfo(String lInfo) {
		this.lInfo = lInfo;
	}

	public String getlDate() {
		return lDate;
	}

	public void setlDate(String lDate) {
		this.lDate = lDate;
	}

	public String getlCategory() {
		return lCategory;
	}

	public void setlCategory(String lCategory) {
		this.lCategory = lCategory;
	}

	public String getlCost() {
		return lCost;
	}

	public void setlCost(String lCost) {
		this.lCost = lCost;
	}

	@Override
	public String toString() {
		return "자격증 번호 =" + lNo + ", 자격증 명 =" + lName + ", 자격증 정보 =" + lInfo + ", 시험 일자 =" + lDate + ", 자격증 분류 ="
				+ lCategory + ", 응시 비용 =" + lCost + "]";
	}

}
