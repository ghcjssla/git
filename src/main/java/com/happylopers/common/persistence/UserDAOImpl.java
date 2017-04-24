package com.happylopers.common.persistence;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.happylopers.board.domain.UserVO;
import com.happylopers.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO{
	@Inject
	private SqlSession session;
	
	

	private static String namespace = "com.happylopers.mapper.common.UserMapper";
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		return session.selectOne(namespace+".login", dto);
	}

	@Override
	public UserVO loginFB(LoginDTO dto) {
		return session.selectOne(namespace+".loginFB", dto);
	}
	
	@Override
	public boolean joinTheHappyLopers(UserVO vo) {
		boolean result = false;
		int count = session.insert(namespace+".joinTheHappyLopers", vo);
		if(count > 0){
			result = true;
		}
		return result;
	}
	
	@Override
	public void keepLogin(String uid, String sessionId, Date next) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("uid", uid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		session.update(namespace+".keepLogin",paramMap);
	}

	@Override
	public UserVO checkUserWithSessionKey(String value) {
		return session.selectOne(namespace+".checkUserWithSessionKey",value);
	}
	
	@Override
	public boolean checkDuplicatedUserWithFacebook(String value) {
		//유저가있으면 flase 없으면 true
		boolean seccess = false;
		UserVO userVO = session.selectOne(namespace+".checkDuplicatedUserWithFacebook",value);
		if(null == userVO){
			seccess = true;
		}
		return seccess;
	}
	
	@Override
	public boolean checkDuplicatedUserId(String uid) {
		//유저가있으면 flase 없으면 true
		boolean seccess = false;
		UserVO userVO = session.selectOne(namespace+".checkDuplicatedUserId",uid);
		if(null == userVO){
			seccess = true;
		}
		return seccess;
	}
	
	
}
