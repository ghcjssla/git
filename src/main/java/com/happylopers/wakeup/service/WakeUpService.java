package com.happylopers.wakeup.service;

import java.util.List;

import com.happylopers.wakeup.domain.WakeUpVO;


public interface WakeUpService {
	public List<WakeUpVO> list() throws Exception;
	public void regist(WakeUpVO vo) throws Exception;
	public void remove(WakeUpVO vo) throws Exception;
	public void modify(String modal_date, String modal_comment, int modal_seq)throws Exception;
}


