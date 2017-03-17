package com.happylopers.board.domain;

import java.util.Date;

public class UserVO {

  private String uid;
  private String upw;
  private String uname;
  private String fbid;
  private String email;
  private int upoint;
  private Date regdate;
  private String userimg;
  
  
  
public String getUserimg() {
	return userimg;
}

public void setUserimg(String userimg) {
	this.userimg = userimg;
}

public Date getRegdate() {
	return regdate;
}

public void setRegdate(Date regdate) {
	this.regdate = regdate;
}

public String getFbid() {
	return fbid;
}

public void setFbid(String fbid) {
	this.fbid = fbid;
}

public String getEmail() {
	return email;
}

public void setEmail(String email) {
	this.email = email;
}

public String getUid() {
    return uid;
  }

  public void setUid(String uid) {
    this.uid = uid;
  }

  public String getUpw() {
    return upw;
  }

  public void setUpw(String upw) {
    this.upw = upw;
  }

  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }

  public int getUpoint() {
    return upoint;
  }

  public void setUpoint(int upoint) {
    this.upoint = upoint;
  }

@Override
public String toString() {
	return "UserVO [uid=" + uid + ", upw=" + upw + ", uname=" + uname + ", fbid=" + fbid + ", email=" + email
			+ ", upoint=" + upoint + ", regdate=" + regdate + ", userimg=" + userimg + "]";
}

  
}
