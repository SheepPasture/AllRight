package com.sheep.jsp.boardComment.model.vo;

import java.sql.Date;

public class BoardComment {
	
	private int cNo;
	private int bNo;
	private int bId;
	private int userNo;
	private int cPwd;
	private String cContent;
	private Date cDate;
	private int cLevel;
	private int report;
	private String cStatus;
	private String nickname;
	private String userId;

	
	// 생성자
	public BoardComment() {
		super();
	}

	public BoardComment(int cNo, String cContent, int userNo, Date cDate, int cLevel) {
		super();
		this.cNo = cNo;
		this.cContent = cContent;
		this.userNo = userNo;
		this.cDate = cDate;
		this.cLevel = cLevel;
	}



	public BoardComment(int cNo, int bNo, int bId, int userNo, int cPwd, String cContent, Date cDate, int cLevel,
			int report, String cStatus, String nickname, String userId) {
		super();
		this.cNo = cNo;
		this.bNo = bNo;
		this.bId = bId;
		this.userNo = userNo;
		this.cPwd = cPwd;
		this.cContent = cContent;
		this.cDate = cDate;
		this.cLevel = cLevel;
		this.report = report;
		this.cStatus = cStatus;
		this.nickname = nickname;
		this.userId = userId;
	}

	// getter & setter

	public int getcNo() {
		return cNo;
	}


	public void setcNo(int cNo) {
		this.cNo = cNo;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
	}


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	public int getcPwd() {
		return cPwd;
	}


	public void setcPwd(int cPwd) {
		this.cPwd = cPwd;
	}


	public String getcContent() {
		return cContent;
	}


	public void setcContent(String cContent) {
		this.cContent = cContent;
	}


	public Date getcDate() {
		return cDate;
	}


	public void setcDate(Date cDate) {
		this.cDate = cDate;
	}


	public int getcLevel() {
		return cLevel;
	}


	public void setcLevel(int cLevel) {
		this.cLevel = cLevel;
	}


	public int getReport() {
		return report;
	}


	public void setReport(int report) {
		this.report = report;
	}


	public String getcStatus() {
		return cStatus;
	}


	public void setcStatus(String cStatus) {
		this.cStatus = cStatus;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	// toString()


	@Override
	public String toString() {
		return "BoardComment [cNo=" + cNo + ", bNo=" + bNo + ", bId=" + bId + ", userNo=" + userNo + ", cPwd=" + cPwd
				+ ", cContent=" + cContent + ", cDate=" + cDate + ", cLevel=" + cLevel + ", report=" + report
				+ ", cStatus=" + cStatus + ", nickname=" + nickname + ", userId=" + userId + "]";
	}

	// hashCode()
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bId;
		result = prime * result + bNo;
		result = prime * result + ((cContent == null) ? 0 : cContent.hashCode());
		result = prime * result + ((cDate == null) ? 0 : cDate.hashCode());
		result = prime * result + cLevel;
		result = prime * result + cNo;
		result = prime * result + cPwd;
		result = prime * result + ((cStatus == null) ? 0 : cStatus.hashCode());
		result = prime * result + ((nickname == null) ? 0 : nickname.hashCode());
		result = prime * result + report;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
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
		BoardComment other = (BoardComment) obj;
		if (bId != other.bId)
			return false;
		if (bNo != other.bNo)
			return false;
		if (cContent == null) {
			if (other.cContent != null)
				return false;
		} else if (!cContent.equals(other.cContent))
			return false;
		if (cDate == null) {
			if (other.cDate != null)
				return false;
		} else if (!cDate.equals(other.cDate))
			return false;
		if (cLevel != other.cLevel)
			return false;
		if (cNo != other.cNo)
			return false;
		if (cPwd != other.cPwd)
			return false;
		if (cStatus == null) {
			if (other.cStatus != null)
				return false;
		} else if (!cStatus.equals(other.cStatus))
			return false;
		if (nickname == null) {
			if (other.nickname != null)
				return false;
		} else if (!nickname.equals(other.nickname))
			return false;
		if (report != other.report)
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userNo != other.userNo)
			return false;
		return true;
	}
	
	
	
	
	

}
