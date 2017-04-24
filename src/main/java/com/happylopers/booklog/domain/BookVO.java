package com.happylopers.booklog.domain;

import java.util.Date;

public class BookVO {
	private Integer seq;
	private String name;
	private Integer total_page;
	private Date regdate;
	private Integer last_page;
	private String finish;
	private String uid;
	/* 원래 여기있음 안되고 그냥 TO에 있어야 하는데 귀찮아서 그냥 놨음 많아지면 분리 필요 */
	private String mode;
	
	private String link;
	private String link_name;
	
	
	public String getMode() {
		return mode;
	}
	public void setMode(String mode) {
		this.mode = mode;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public Integer getSeq() {
		return seq;
	}
	public void setSeq(Integer seq) {
		this.seq = seq;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getTotal_page() {
		return total_page;
	}
	public void setTotal_page(Integer total_page) {
		this.total_page = total_page;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getLast_page() {
		return last_page;
	}
	public void setLast_page(Integer last_page) {
		this.last_page = last_page;
	}
	public String getFinish() {
		return finish;
	}
	public void setFinish(String finish) {
		this.finish = finish;
	}
	
	
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getLink_name() {
		return link_name;
	}
	public void setLink_name(String link_name) {
		this.link_name = link_name;
	}
	@Override
	public String toString() {
		return "BookVO [seq=" + seq + ", name=" + name + ", total_page=" + total_page + ", regdate=" + regdate
				+ ", last_page=" + last_page + ", finish=" + finish + ", uid=" + uid + ", mode=" + mode + ", link="
				+ link + ", link_name=" + link_name + "]";
	}
	
	
	
	
}















