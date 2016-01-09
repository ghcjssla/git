package com.happylopers.wakeup.service;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.springframework.stereotype.Service;

import com.happylopers.wakeup.domain.WakeUpVO;
import com.happylopers.wakeup.persistence.WakeUpDAO;

@Service
public class WakeUpServiceImpl implements WakeUpService{
	
	@Inject
	private WakeUpDAO dao;
	
	@Override
	public List<WakeUpVO> list() throws Exception {
		return dao.list();
	}

	@Override
	public void regist(WakeUpVO vo) throws Exception {
		System.out.println("date값 출력하면 어케 되나 "+vo.getDate());
		/*
		Calendar cal = Calendar.getInstance();
		cal.set(1987, 11, 25);
		Date date = cal.getTime();
		 */
		dao.create(vo);
	}

	@Override
	public void remove(WakeUpVO vo) throws Exception {
		dao.delete(vo);
	}


}
