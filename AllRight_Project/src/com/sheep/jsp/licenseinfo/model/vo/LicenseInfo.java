package com.sheep.jsp.licenseinfo.model.vo;

public class LicenseInfo {

	private int lNo;
	private String lName;
	private String lInfo;
	private String lDate;
	private String lCategory;
	private int lCost1;
	private int lCost2;
	
	// 생성자
	
	
	public LicenseInfo() {
		super();
	}

	public LicenseInfo(int lNo, String lName, String lInfo, String lDate, String lCategory, int lCost1, int lCost2) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lInfo = lInfo;
		this.lDate = lDate;
		this.lCategory = lCategory;
		this.lCost1 = lCost1;
		this.lCost2 = lCost2;
	}

	
	// getter & setter
	
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

	public int getlCost1() {
		return lCost1;
	}

	public void setlCost1(int lCost1) {
		this.lCost1 = lCost1;
	}

	public int getlCost2() {
		return lCost2;
	}

	public void setlCost2(int lCost2) {
		this.lCost2 = lCost2;
	}

	
	// toString()
	@Override
	public String toString() {
		return "LicenseInfo [lNo=" + lNo + ", lName=" + lName + ", lInfo=" + lInfo + ", lDate=" + lDate + ", lCategory="
				+ lCategory + ", lCost1=" + lCost1 + ", lCost2=" + lCost2 + "]";
	}
	
	//hashCode()

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((lCategory == null) ? 0 : lCategory.hashCode());
		result = prime * result + lCost1;
		result = prime * result + lCost2;
		result = prime * result + ((lDate == null) ? 0 : lDate.hashCode());
		result = prime * result + ((lInfo == null) ? 0 : lInfo.hashCode());
		result = prime * result + ((lName == null) ? 0 : lName.hashCode());
		result = prime * result + lNo;
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
		if (lCost1 != other.lCost1)
			return false;
		if (lCost2 != other.lCost2)
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
		if (lNo != other.lNo)
			return false;
		return true;
	}
	
	
	
	

}
