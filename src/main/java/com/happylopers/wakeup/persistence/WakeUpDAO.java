package com.happylopers.wakeup.persistence;

import java.util.List;

import com.happylopers.wakeup.domain.WakeUpVO;

public interface WakeUpDAO {
	public List<WakeUpVO> list() throws Exception;
	public void create(WakeUpVO vo)throws Exception;
	public void delete(WakeUpVO vo)throws Exception;
	void insertGoSleep(WakeUpVO vo) throws Exception;
	void updateWakeUp(WakeUpVO vo) throws Exception;
	public WakeUpVO selectLatestDateInfo();
}
