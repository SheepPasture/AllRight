package com.sheep.jsp.licenseinfo.model.vo;

import java.util.ArrayList;
import java.util.List;

public class LicenseInfo {

	private String lNo;
	private String lName;
	private List<String> lInfo = new ArrayList<String>();
	private String lDate;
	private String lCategory;
	private String lCost;
	private String dDay;
	private String lType;
	private String nInfo01;
	private String nlnfo02;
	private String nlnfo03;
	
	// 생성자
	
	public LicenseInfo() {}

	public LicenseInfo(String lNo, String lName, List<String> lInfo, String lDate, String lCategory, String lCost,
			String dDay, String lType, String nInfo01, String nlnfo02, String nlnfo03) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lInfo = lInfo;
		this.lDate = lDate;
		this.lCategory = lCategory;
		this.lCost = lCost;
		this.dDay = dDay;
		this.lType = lType;
		this.nInfo01 = nInfo01;
		this.nlnfo02 = nlnfo02;
		this.nlnfo03 = nlnfo03;
	}

	public LicenseInfo(String lNo, String lName, String lDate, String lCategory, String lCost, String dDay,
			String lType, String nInfo01, String nlnfo02, String nlnfo03) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lDate = lDate;
		this.lCategory = lCategory;
		this.lCost = lCost;
		this.dDay = dDay;
		this.lType = lType;
		this.nInfo01 = nInfo01;
		this.nlnfo02 = nlnfo02;
		this.nlnfo03 = nlnfo03;
	}

	public LicenseInfo(String lNo, String lName, List<String> lInfo, String lDate, String lCategory, String lCost) {
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

	public LicenseInfo(String lNo, String lName, String lCategory, String lCost) {
		super();
		this.lNo = lNo;
		this.lName = lName;
		this.lCategory = lCategory;
		this.lCost = lCost;
	}
	
	public LicenseInfo(String lCost) {
		super();
		this.lCost = lCost;
	}
	
	public LicenseInfo(List<String> lInfo) {
		super();
		this.lInfo = lInfo;
	}
	
	public LicenseInfo(String lName, List<String> lInfo, String lDate, String dDay,String lType) {
		super();
		this.lName = lName;
		this.lInfo = lInfo;
		this.lDate = lDate;
		this.dDay = dDay;
		this.lType=lType;
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

	public List<String> getlInfo() {
		return lInfo;
	}

	public void setlInfo(List<String> lInfo) {
		this.lInfo = lInfo;
	}
	
	public void addlInfo(String lInfo) {
		this.lInfo.add(lInfo);
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
	
	public String getdDay() {
		return dDay;
	}

	public void setdDay(String dDay) {
		this.dDay = dDay;
	}
	public String getlType() {
		return lType;
	}

	public void setlType(String lType) {
		this.lType = lType;
	}

	// toString()
	@Override
	public String toString() {
		return "LicenseInfo [lNo=" + lNo + ", lName=" + lName + ", lInfo=" + lInfo + ", lDate=" + lDate + ", lCategory="
				+ lCategory + ", lCost=" + lCost + ", dDay=" + dDay + ", lType=" + lType + ", nInfo01=" + nInfo01
				+ ", nlnfo02=" + nlnfo02 + ", nlnfo03=" + nlnfo03 + "]";
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


	public String getnInfo01() {
		return nInfo01;
	}


	public void setnInfo01(String nInfo01) {
		this.nInfo01 = nInfo01;
	}


	public String getNlnfo02() {
		return nlnfo02;
	}


	public void setNlnfo02(String nlnfo02) {
		this.nlnfo02 = nlnfo02;
	}


	public String getNlnfo03() {
		return nlnfo03;
	}


	public void setNlnfo03(String nlnfo03) {
		this.nlnfo03 = nlnfo03;
	}
	

}
