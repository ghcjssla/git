package com.happylopers.common.persistence;

import java.util.Date;

import com.happylopers.board.domain.UserVO;
import com.happylopers.dto.LoginDTO;

public interface UserDAO {
	public UserVO login(LoginDTO dto)throws Exception;
	public void keepLogin(String uid, String sessionId, Date next);
	public UserVO checkUserWithSessionKey(String value);
	public UserVO loginFB(LoginDTO dto);
	boolean joinTheHappyLopers(UserVO vo);
	public boolean checkDuplicatedUserWithFacebook(String value);
	public boolean checkDuplicatedUserId(String uid);
}
