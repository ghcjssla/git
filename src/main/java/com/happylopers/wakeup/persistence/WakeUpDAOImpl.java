package com.happylopers.wakeup.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.happylopers.wakeup.domain.WakeUpVO;

@Repository
public class WakeUpDAOImpl implements WakeUpDAO{
	@Inject SqlSession session;

	private static String namespace = "com.happylopers.mapper.wakeup.wakeupMapper";
	
	@Override
	public List<WakeUpVO> list() throws Exception {
		return session.selectList(namespace+".list");
	}

	@Override
	public void create(WakeUpVO vo) throws Exception {
		System.out.println("WakeUpDAOImpl에서 호출 : "+vo.getTime_wakeup());
		session.insert(namespace+".create", vo);
	}
	
	/**
	 * 취침기능
	 * 새로운 시간을 입력한다.
	 */
	@Override
	public void insertGoSleep(WakeUpVO vo) throws Exception {
		System.out.println("WakeUpDAOImpl에서 호출 : "+vo.getTime_sleep());
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
	
	@Override
	public void delete(WakeUpVO vo) throws Exception {
		session.delete(namespace+".delete", vo);
	}

	@Override
	public WakeUpVO selectLatestDateInfo() {
		return session.selectOne(namespace+".latestDateInfo");
	}

} 
