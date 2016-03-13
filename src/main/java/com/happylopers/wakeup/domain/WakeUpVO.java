package com.happylopers.wakeup.domain;

import java.util.Date;

public class WakeUpVO {
	private int seq;
	private Date time_wakeup;
	private Date time_sleep;
	private String comment;
	
	public Date getTime_sleep() {
		return time_sleep;
	}
	public void setTime_sleep(Date time_sleep) {
		this.time_sleep = time_sleep;
	}
	
	public Date getTime_wakeup() {
		return time_wakeup;
	}
	public void setTime_wakeup(Date time_wakeup) {
		this.time_wakeup = time_wakeup;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	@Override
	public String toString() {
		return "WakeUpVO [seq=" + seq + ", time_wakeup=" + time_wakeup + ", time_sleep=" + time_sleep + ", comment="
				+ comment + "]";
	}
	
	
}
