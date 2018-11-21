package com.sheep.jsp.category.model.vo;

import java.io.Serializable;

public class Category implements Serializable{
	
	private int eid;
	private String etitle;
	private int ecount;
	
	public Category() {
		super();
	}

	public Category(int eid, String etitle, int ecount) {
		super();
		this.eid = eid;
		this.etitle = etitle;
		this.ecount = ecount;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getEtitle() {
		return etitle;
	}

	public void setEtitle(String etitle) {
		this.etitle = etitle;
	}

	public int getEcount() {
		return ecount;
	}

	public void setEcount(int ecount) {
		this.ecount = ecount;
	}

	@Override
	public String toString() {
		return "Category [eid=" + eid + ", etitle=" + etitle + ", ecount=" + ecount + "]";
	}
	
	
	

}
