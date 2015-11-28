package com.happylopers.first.service;

import com.happylopers.first.vo.MemberVO;

public interface MemberDAO {
	public String getTime();
	public void insertMember(MemberVO vo);
	public MemberVO readMember(String userid)throws Exception;
	public MemberVO readWithPW(String userid, String userpw)throws Exception;
}
