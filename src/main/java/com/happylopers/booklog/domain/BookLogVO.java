package com.happylopers.booklog.domain;

import java.util.Date;

public class BookLogVO {
	private int seq;
	private int book_seq;
	private Date start_date;
	private Date end_date;
	private int last_page;
	private String comment;
	private String finish;
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getBook_seq() {
		return book_seq;
	}
	public void setBook_seq(int book_seq) {
		this.book_seq = book_seq;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public int getLast_page() {
		return last_page;
	}
	public void setLast_page(int last_page) {
		this.last_page = last_page;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	
	
	@Override
	public String toString() {
		return "BookLogVO [seq=" + seq + ", book_seq=" + book_seq + ", start_date=" + start_date + ", end_date="
				+ end_date + ", last_page=" + last_page + ", comment=" + comment + ", finish=" + finish + "]";
	}
}
