package com.sheep.jsp.announcement.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Announcement implements Serializable {

	private static final long serialVersionUID = -3282413633718786490L;
	
	private int ano;
	private String atitle;
	private int acount;
	private String acontent;
	private Date adate;
	private String fAno;
	
	public Announcement() {
		super();
	}

	public Announcement(int ano, String atitle, int acount, Date adate) {
		super();
		this.ano = ano;
		this.atitle = atitle;
		this.acount = acount;
		this.adate = adate;
	}
	
	public Announcement(int ano, String atitle){
		super();
		this.ano = ano;
		this.atitle = atitle;
	}

	public Announcement(int ano, String atitle, int acount, String acontent, Date adate) {
		super();
		this.ano = ano;
		this.atitle = atitle;
		this.acount = acount;
		this.acontent = acontent;
		this.adate = adate;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getAtitle() {
		return atitle;
	}

	public void setAtitle(String atitle) {
		this.atitle = atitle;
	}

	public int getAcount() {
		return acount;
	}

	public void setAcount(int acount) {
		this.acount = acount;
	}

	public String getAcontent() {
		return acontent;
	}

	public void setAcontent(String acontent) {
		this.acontent = acontent;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

	@Override
	public String toString() {
		return "Announcement [ano=" + ano + ", atitle=" + atitle + ", acount=" + acount + ", acontent=" + acontent
				+ ", adate=" + adate + "]";
	}

	public String getfAno() {
		return fAno;
	}

	public void setfAno(String fAno) {
		this.fAno = fAno;
	}
	
	


	// hashCode()
/*	
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
	
	
	*/
	
	
	
	

}
