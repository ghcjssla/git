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
		System.out.println("WakeUpDAOImpl에서 호출 : "+vo.getDate());
		session.insert(namespace+".create", vo);
	}

	@Override
	public void delete(WakeUpVO vo) throws Exception {
		session.delete(namespace+".delete", vo);
	}
	
} 
