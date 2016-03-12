package com.happylopers.booklog.domain;

import java.util.Date;

public class BookVO {
	private int seq;
	private String name;
	private int total_page;
	private Date regdate;
	private int last_page;
	private String finish;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTotal_page() {
		return total_page;
	}
	public void setTotal_page(int total_page) {
		this.total_page = total_page;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getLast_page() {
		return last_page;
	}
	public void setLast_page(int last_page) {
		this.last_page = last_page;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	@Override
	public String toString() {
		return "BookVO [seq=" + seq + ", name=" + name + ", total_page=" + total_page + ", regdate=" + regdate
				+ ", last_page=" + last_page + ", finish=" + finish + "]";
	}
	
	
}















