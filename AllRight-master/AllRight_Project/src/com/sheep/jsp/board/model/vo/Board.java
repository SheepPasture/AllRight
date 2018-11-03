package com.sheep.jsp.board.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Board implements Serializable{
	
	
	private static final long serialVersionUID = 2000L;

	// 필드
	
	private int bId;
	private int bNo;
	private String bTitle;
    private String bContent;
	private String bWriter;
	private int bCount;
	private String boardFile;
	private Date bDate;
	private String status;
	
	
	// 생성자
	
	public Board() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Board(String bTitle, String bContent, String bWriter, String boardFile) {
		super();
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.boardFile = boardFile;
	}


	public Board(int bId, int bNo, String bTitle, String bContent, String bWriter, int bCount, String boardFile,
			Date bDate, String status) {
		super();
		this.bId = bId;
		this.bNo = bNo;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bWriter = bWriter;
		this.bCount = bCount;
		this.boardFile = boardFile;
		this.bDate = bDate;
		this.status = status;
	}
	
	
	
	// getter & setter


	public int getbId() {
		return bId;
	}


	public void setbId(int bId) {
		this.bId = bId;
	}


	public int getbNo() {
		return bNo;
	}


	public void setbNo(int bNo) {
		this.bNo = bNo;
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


	public String getBoardFile() {
		return boardFile;
	}


	public void setBoardFile(String boardFile) {
		this.boardFile = boardFile;
	}


	public Date getbDate() {
		return bDate;
	}


	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	// toString()

	@Override
	public String toString() {
		return "Board [bId=" + bId + ", bNo=" + bNo + ", bTitle=" + bTitle + ", bContent=" + bContent + ", bWriter="
				+ bWriter + ", bCount=" + bCount + ", boardFile=" + boardFile + ", bDate=" + bDate + ", status="
				+ status + "]";
	}
	
	
	
	
	
	

	
	
	
	
}
