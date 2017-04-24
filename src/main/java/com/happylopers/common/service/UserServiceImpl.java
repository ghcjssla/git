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
	public boolean joinTheHappyLopers(UserVO vo) throws Exception {
		boolean success = false;
		/**
		 * 1. 기존 회원데이터에서 페이스북으로 가입된 데이터가 있는지 찾는다.
		 * 1-1 가입된 데이터가 있다면 가입중지
		 * 1-2 가입된 데이터가 없다면 2번 실행
		 * 2. 페이스북아이디를 이용해서 데이터를 입력한다.
		*/
		if(dao.checkDuplicatedUserWithFacebook(vo.getFbid())){
			success = dao.joinTheHappyLopers(vo);
		}
		return success;
	}

	
	@Override
	public UserVO loginFB(LoginDTO dto) throws Exception {
		return dao.loginFB(dto);
	}
	
	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {
		dao.keepLogin(uid, sessionId, next);
	}

	@Override
	public UserVO checkLoginBefore(String value) {
		return dao.checkUserWithSessionKey(value);
	}

	@Override
	public boolean checkDuplicatedUserWithFacebook(String fbid) {
		//유저가있으면 flase 없으면 true
		return dao.checkDuplicatedUserWithFacebook(fbid);
	}
	
	@Override
	public boolean checkDuplicatedUserId(String uid) {
		//유저가있으면 flase 없으면 true
		return dao.checkDuplicatedUserId(uid);
	}
	
	
}
