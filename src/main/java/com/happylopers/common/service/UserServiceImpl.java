package com.happylopers.common.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.happylopers.board.domain.UserVO;
import com.happylopers.common.persistence.UserDAO;
import com.happylopers.dto.LoginDTO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO dao;
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		dao.keepLogin(uid, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}

}
