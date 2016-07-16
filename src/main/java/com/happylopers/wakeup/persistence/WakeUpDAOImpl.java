package com.happylopers.wakeup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.happylopers.board.domain.UserVO;
import com.happylopers.wakeup.domain.WakeUpVO;

@Repository
public class WakeUpDAOImpl implements WakeUpDAO{
	@Inject SqlSession session;

	private static String namespace = "com.happylopers.mapper.wakeup.wakeupMapper";
	
	@Override
	public List<WakeUpVO> list(UserVO vo) throws Exception {
		return session.selectList(namespace+".list", vo);
	}

	@Override
	public void create(WakeUpVO vo) throws Exception {
		session.insert(namespace+".create", vo);
	}
	
	/**
	 * 취침기능
	 * 새로운 시간을 입력한다.
	 */
	@Override
	public void insertGoSleep(WakeUpVO vo) throws Exception {
		session.insert(namespace+".insertGoSleep", vo);
	}

	/**
	 * 기상기능
	 * 기존에 취침시간이 입력된 건에 대해 기상시간을 입력한다.
	 */
	@Override
	public void updateWakeUp(WakeUpVO vo) throws Exception {
		session.update(namespace+".updateWakeUp", vo);
	}

	/**
	 * 기상기능 기존에 취침누르고 기상누르는방식이 제대로 시행되지 않아서
	 * 그냥 기상만 누르면 되게끔 변경함
	 * 새로운 시간을 입력한다.
	 */
	@Override
	public void insertWakeUp(WakeUpVO vo) throws Exception {
		session.insert(namespace+".insertWakeUp", vo);
	}

	
	@Override
	public void delete(WakeUpVO vo) throws Exception {
		session.delete(namespace+".delete", vo);
	}

	@Override
	public WakeUpVO selectLatestDateInfo(UserVO vo) {
		return session.selectOne(namespace+".latestDateInfo", vo);
	}
} 
