package com.sheep.jsp.news.model.vo;

import java.sql.Date;

public class News {
	
	private int NNO;
	private String NTITLE;
	private String NCONTENT;
	private int NCOUNT;
	private Date NDATE;
	private String NFILE;
	
	// 생성자
	
	public News() {
		super();
	}
	
	

	public News(int nNO, String nTITLE, String nCONTENT, int nCOUNT, Date nDATE, String nFILE) {
		super();
		NNO = nNO;
		NTITLE = nTITLE;
		NCONTENT = nCONTENT;
		NCOUNT = nCOUNT;
		NDATE = nDATE;
		NFILE = nFILE;
	}
	
	// getter & setter

	public int getNNO() {
		return NNO;
	}

	public void setNNO(int nNO) {
		NNO = nNO;
	}

	public String getNTITLE() {
		return NTITLE;
	}

	public void setNTITLE(String nTITLE) {
		NTITLE = nTITLE;
	}

	public String getNCONTENT() {
		return NCONTENT;
	}

	public void setNCONTENT(String nCONTENT) {
		NCONTENT = nCONTENT;
	}

	public int getNCOUNT() {
		return NCOUNT;
	}

	public void setNCOUNT(int nCOUNT) {
		NCOUNT = nCOUNT;
	}

	public Date getNDATE() {
		return NDATE;
	}

	public void setNDATE(Date nDATE) {
		NDATE = nDATE;
	}

	public String getNFILE() {
		return NFILE;
	}

	public void setNFILE(String nFILE) {
		NFILE = nFILE;
	}
	
	
	// toString()

	@Override
	public String toString() {
		return "News [NNO=" + NNO + ", NTITLE=" + NTITLE + ", NCONTENT=" + NCONTENT + ", NCOUNT=" + NCOUNT + ", NDATE="
				+ NDATE + ", NFILE=" + NFILE + "]";
	}
	
	// hashCode()

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((NCONTENT == null) ? 0 : NCONTENT.hashCode());
		result = prime * result + NCOUNT;
		result = prime * result + ((NDATE == null) ? 0 : NDATE.hashCode());
		result = prime * result + ((NFILE == null) ? 0 : NFILE.hashCode());
		result = prime * result + NNO;
		result = prime * result + ((NTITLE == null) ? 0 : NTITLE.hashCode());
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
		News other = (News) obj;
		if (NCONTENT == null) {
			if (other.NCONTENT != null)
				return false;
		} else if (!NCONTENT.equals(other.NCONTENT))
			return false;
		if (NCOUNT != other.NCOUNT)
			return false;
		if (NDATE == null) {
			if (other.NDATE != null)
				return false;
		} else if (!NDATE.equals(other.NDATE))
			return false;
		if (NFILE == null) {
			if (other.NFILE != null)
				return false;
		} else if (!NFILE.equals(other.NFILE))
			return false;
		if (NNO != other.NNO)
			return false;
		if (NTITLE == null) {
			if (other.NTITLE != null)
				return false;
		} else if (!NTITLE.equals(other.NTITLE))
			return false;
		return true;
	}
	
	
}
