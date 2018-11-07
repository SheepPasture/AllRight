package com.sheep.jsp.licenseinfo.model.vo;

public class LicenseInfo {

	private String lNo;
	private String lName;
	private String lInfo;
	private String lDate;
	private String lCategory;
	private String lCost;
	
	// 생성자
	
	
	public LicenseInfo() {}

	public LicenseInfo(String lNo, String lName, String lInfo, String lDate, String lCategory, String lCost) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lInfo = lInfo;
		this.lDate = lDate;
		this.lCategory = lCategory;
		this.lCost = lCost;
	}
	
	public LicenseInfo(String lNo, String lName, String lCategory) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lCategory = lCategory;
	}

	// getter & setter
	
	public String getlNo() {
		return lNo;
	}

	public void setlNo(String lNo) {
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


	// toString()
	@Override
	public String toString() {
		return "자격증 번호 =" + lNo + ", 자격증 명 =" + lName + ", 자격증 정보 =" + lInfo + ", 시험 일자 =" + lDate + ", 자격증 분류 ="
				+ lCategory + ", 응시 비용 =" + lCost;
	}

	//hashCode()
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lCategory == null) ? 0 : lCategory.hashCode());
		result = prime * result + ((lCost == null) ? 0 : lCost.hashCode());
		result = prime * result + ((lDate == null) ? 0 : lDate.hashCode());
		result = prime * result + ((lInfo == null) ? 0 : lInfo.hashCode());
		result = prime * result + ((lName == null) ? 0 : lName.hashCode());
		result = prime * result + ((lNo == null) ? 0 : lNo.hashCode());
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
		LicenseInfo other = (LicenseInfo) obj;
		if (lCategory == null) {
			if (other.lCategory != null)
				return false;
		} else if (!lCategory.equals(other.lCategory))
			return false;
		if (lCost == null) {
			if (other.lCost != null)
				return false;
		} else if (!lCost.equals(other.lCost))
			return false;
		if (lDate == null) {
			if (other.lDate != null)
				return false;
		} else if (!lDate.equals(other.lDate))
			return false;
		if (lInfo == null) {
			if (other.lInfo != null)
				return false;
		} else if (!lInfo.equals(other.lInfo))
			return false;
		if (lName == null) {
			if (other.lName != null)
				return false;
		} else if (!lName.equals(other.lName))
			return false;
		if (lNo == null) {
			if (other.lNo != null)
				return false;
		} else if (!lNo.equals(other.lNo))
			return false;
		return true;
	}
	

}
