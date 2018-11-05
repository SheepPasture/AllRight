package com.sheep.jsp.announcement.model.vo;

import java.sql.Date;

public class Announcement {
	
	
	
	private int ANO;
	private String ATITLE;
	private int ACOUNT;
	private String ACONTENT;
	private Date ADATE;
	

	// 생성자
	
	public Announcement() {
		super();
	}


	public Announcement(int aNO, String aTITLE, int aCOUNT, String aCONTENT, Date aDATE) {
		super();
		ANO = aNO;
		ATITLE = aTITLE;
		ACOUNT = aCOUNT;
		ACONTENT = aCONTENT;
		ADATE = aDATE;
	}

	
	// getter & setter

	public int getANO() {
		return ANO;
	}


	public void setANO(int aNO) {
		ANO = aNO;
	}


	public String getATITLE() {
		return ATITLE;
	}


	public void setATITLE(String aTITLE) {
		ATITLE = aTITLE;
	}


	public int getACOUNT() {
		return ACOUNT;
	}


	public void setACOUNT(int aCOUNT) {
		ACOUNT = aCOUNT;
	}


	public String getACONTENT() {
		return ACONTENT;
	}


	public void setACONTENT(String aCONTENT) {
		ACONTENT = aCONTENT;
	}


	public Date getADATE() {
		return ADATE;
	}


	public void setADATE(Date aDATE) {
		ADATE = aDATE;
	}


	
	// toString()
	
	@Override
	public String toString() {
		return "Announcement [ANO=" + ANO + ", ATITLE=" + ATITLE + ", ACOUNT=" + ACOUNT + ", ACONTENT=" + ACONTENT
				+ ", ADATE=" + ADATE + "]";
	}


	// hashCode()
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((ACONTENT == null) ? 0 : ACONTENT.hashCode());
		result = prime * result + ACOUNT;
		result = prime * result + ((ADATE == null) ? 0 : ADATE.hashCode());
		result = prime * result + ANO;
		result = prime * result + ((ATITLE == null) ? 0 : ATITLE.hashCode());
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
		Announcement other = (Announcement) obj;
		if (ACONTENT == null) {
			if (other.ACONTENT != null)
				return false;
		} else if (!ACONTENT.equals(other.ACONTENT))
			return false;
		if (ACOUNT != other.ACOUNT)
			return false;
		if (ADATE == null) {
			if (other.ADATE != null)
				return false;
		} else if (!ADATE.equals(other.ADATE))
			return false;
		if (ANO != other.ANO)
			return false;
		if (ATITLE == null) {
			if (other.ATITLE != null)
				return false;
		} else if (!ATITLE.equals(other.ATITLE))
			return false;
		return true;
	}
	
	
	
	
	
	
	

}
