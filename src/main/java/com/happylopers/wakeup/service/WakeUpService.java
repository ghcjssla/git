package com.happylopers.wakeup.service;

import java.util.List;

import com.happylopers.board.domain.UserVO;
import com.happylopers.wakeup.domain.WakeUpVO;


public interface WakeUpService {
	public List<WakeUpVO> list(UserVO vo) throws Exception;
	public void updateWakeUp(WakeUpVO vo) throws Exception;
	public void remove(WakeUpVO vo) throws Exception;
	public void modify(String modal_date, String modal_comment, int modal_seq)throws Exception;
	public void insertGoSleep(WakeUpVO vo) throws Exception;
	public WakeUpVO selectLatestDateInfo(UserVO vo) throws Exception;
	public void insertWakeUp(WakeUpVO vo) throws Exception;
}


