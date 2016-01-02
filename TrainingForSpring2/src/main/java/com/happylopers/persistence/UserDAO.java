package com.happylopers.persistence;

import java.util.Date;

import com.happylopers.domain.UserVO;
import com.happylopers.dto.LoginDTO;

public interface UserDAO {
	public UserVO login(LoginDTO dto)throws Exception;
	public void keepLogin(String uid, String sessionId, Date next);
	public UserVO checkUserWithSessionKey(String value);
}
