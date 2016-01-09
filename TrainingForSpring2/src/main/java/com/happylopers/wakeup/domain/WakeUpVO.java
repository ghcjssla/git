package com.happylopers.wakeup.domain;

import java.util.Date;

public class WakeUpVO {
	private int seq;
	private Date date;
	private String comment;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "WakeUpVO [seq=" + seq + ", date=" + date + ", comment=" + comment + ", getSeq()=" + getSeq()
				+ ", getDate()=" + getDate() + ", getComment()=" + getComment() + ", getClass()=" + getClass()
				+ ", hashCode()=" + hashCode() + ", toString()=" + super.toString() + "]";
	}
	
	
	
	
}
