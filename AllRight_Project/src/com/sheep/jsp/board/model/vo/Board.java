package com.sheep.jsp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

import com.sheep.jsp.member.model.vo.Member;

public class Board implements Serializable{
	
	
	private static final long serialVersionUID = 2000L;

	
	// 필드 
	
	private int bId;
	private int bNO;
	private String bTitle;
	private String bContent;
	private String bWriter;
	private int bCount;
	private String bFile;
	private Date bDate;
	private String bStatus;
	private int eCount;
	private int report;
	private int bLike;
	private int userNo;
	
	
	// 생성자
	
	
	public Board() {
		super();
	}

	public Board(int bId, int bNO, String bTitle, String bContent, String bWriter, int bCount, String bFile,
			Date bDate, String bStatus, int eCount, int report, int bLike, int userNo) {
		super();
		this.bId = bId;
		this.bNO = bNO;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.bFile = bFile;
		this.bDate = bDate;
		this.bStatus = bStatus;
		this.eCount = eCount;
		this.report = report;
		this.bLike = bLike;
		this.userNo = userNo;
	}
	
	// getter & setter
	
	public int getbId() {
		return bId;
	}

	public void setbId(int bId) {
		this.bId = bId;
	}

	public int getbNO() {
		return bNO;
	}

	public void setbNO(int bNO) {
		this.bNO = bNO;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public int getbCount() {
		return bCount;
	}

	public void setbCount(int bCount) {
		this.bCount = bCount;
	}

	public String getbFile() {
		return bFile;
	}

	public void setbFile(String bFile) {
		this.bFile = bFile;
	}

	public Date getbDate() {
		return bDate;
	}

	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}

	public String getbStatus() {
		return bStatus;
	}

	public void setbStatus(String bStatus) {
		this.bStatus = bStatus;
	}

	public int geteCount() {
		return eCount;
	}

	public void seteCount(int eCount) {
		this.eCount = eCount;
	}

	public int getReport() {
		return report;
	}

	public void setReport(int report) {
		this.report = report;
	}

	public int getbLike() {
		return bLike;
	}

	public void setbLike(int bLike) {
		this.bLike = bLike;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	// toString()
	
	@Override
	public String toString() {
		return "Member [bId=" + bId + ", bNO=" + bNO + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter="
				+ bWriter + ", bCount=" + bCount + ", bFile=" + bFile + ", bDate=" + bDate + ", bStatus=" + bStatus
				+ ", eCount=" + eCount + ", report=" + report + ", bLike=" + bLike + ", userNo=" + userNo + "]";
	}

	
	
	// hashCode()
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((bContent == null) ? 0 : bContent.hashCode());
		result = prime * result + bCount;
		result = prime * result + ((bDate == null) ? 0 : bDate.hashCode());
		result = prime * result + ((bFile == null) ? 0 : bFile.hashCode());
		result = prime * result + bId;
		result = prime * result + bLike;
		result = prime * result + bNO;
		result = prime * result + ((bStatus == null) ? 0 : bStatus.hashCode());
		result = prime * result + ((bTitle == null) ? 0 : bTitle.hashCode());
		result = prime * result + ((bWriter == null) ? 0 : bWriter.hashCode());
		result = prime * result + eCount;
		result = prime * result + report;
		result = prime * result + userNo;
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
		Board other = (Board) obj;
		if (bContent == null) {
			if (other.bContent != null)
				return false;
		} else if (!bContent.equals(other.bContent))
			return false;
		if (bCount != other.bCount)
			return false;
		if (bDate == null) {
			if (other.bDate != null)
				return false;
		} else if (!bDate.equals(other.bDate))
			return false;
		if (bFile == null) {
			if (other.bFile != null)
				return false;
		} else if (!bFile.equals(other.bFile))
			return false;
		if (bId != other.bId)
			return false;
		if (bLike != other.bLike)
			return false;
		if (bNO != other.bNO)
			return false;
		if (bStatus == null) {
			if (other.bStatus != null)
				return false;
		} else if (!bStatus.equals(other.bStatus))
			return false;
		if (bTitle == null) {
			if (other.bTitle != null)
				return false;
		} else if (!bTitle.equals(other.bTitle))
			return false;
		if (bWriter == null) {
			if (other.bWriter != null)
				return false;
		} else if (!bWriter.equals(other.bWriter))
			return false;
		if (eCount != other.eCount)
			return false;
		if (report != other.report)
			return false;
		if (userNo != other.userNo)
			return false;
		return true;
	}

	
	
	

	
	
	
	
}
