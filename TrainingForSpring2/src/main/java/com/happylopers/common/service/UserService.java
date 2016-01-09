package com.happylopers.common.service;

import java.util.Date;

import com.happylopers.board.domain.UserVO;
import com.happylopers.dto.LoginDTO;

public interface UserService {
	public UserVO login(LoginDTO dto) throws Exception;
	public void keepLogin(String uid, String sessionId, Date next)throws Exception;
	public UserVO checkLoginBefore(String value);
}
