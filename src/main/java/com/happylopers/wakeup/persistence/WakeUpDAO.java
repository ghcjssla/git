package com.happylopers.wakeup.persistence;

import java.util.List;

import com.happylopers.board.domain.UserVO;
import com.happylopers.wakeup.domain.WakeUpVO;

public interface WakeUpDAO {
	public List<WakeUpVO> list(UserVO vo) throws Exception;
	public void create(WakeUpVO vo)throws Exception;
	public void delete(WakeUpVO vo)throws Exception;
	public void insertGoSleep(WakeUpVO vo) throws Exception;
	public void updateWakeUp(WakeUpVO vo) throws Exception;
	public WakeUpVO selectLatestDateInfo(UserVO vo);
	public void insertWakeUp(WakeUpVO vo) throws Exception;
}
