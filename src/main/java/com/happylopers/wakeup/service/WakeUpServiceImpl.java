package com.happylopers.wakeup.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.happylopers.board.domain.BoardVO;
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
	public WakeUpVO selectLatestDateInfo() throws Exception {
		return dao.selectLatestDateInfo();
	}

	@Override
	public void updateWakeUp(WakeUpVO vo) throws Exception {
		System.out.println("seq : "+vo.getSeq()+" wakeup_time값 출력하면 어케 되나 "+vo.getTime_wakeup());
		/*
		Calendar cal = Calendar.getInstance();
		cal.set(1987, 11, 25);
		Date date = cal.getTime();
		 */
		dao.updateWakeUp(vo);
	}

	@Override
	public void insertGoSleep(WakeUpVO vo) throws Exception {
		System.out.println("wakeup_sleep값 출력하면 어케 되나 "+vo.getTime_sleep());
		/*
		Calendar cal = Calendar.getInstance();
		cal.set(1987, 11, 25);
		Date date = cal.getTime();
		 */
		dao.insertGoSleep(vo);
	}

	@Override
	public void remove(WakeUpVO vo) throws Exception {
		dao.delete(vo);
	}

	@Override
	public void modify(String modal_date, String modal_comment, int modal_seq) throws Exception {
		WakeUpVO vo = new WakeUpVO();
		String[] hourAndMinute =  modal_date.split(":");
		
		int hour = Integer.parseInt(hourAndMinute[0]) ; 
		int minute = Integer.parseInt(hourAndMinute[1]) ;
		
		System.out.println("modal_date : "+modal_date);
		System.out.println("hour : "+hour);
		System.out.println("minute : "+minute);
		System.out.println("modal_seq : "+modal_seq);
		
		Calendar cal = Calendar.getInstance();
        cal.add(Calendar.HOUR, + hour);
        cal.add(Calendar.MINUTE, + minute);
        
        System.out.println("시"+cal.getTime());
        
        Date makeDate = new Date(cal.getTimeInMillis());
        
        SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd HH:mm:ss", Locale.KOREA);
        System.out.println(format.format(makeDate)); // Fri May 29 11:06:29
        
        System.out.println("마지막에 들어가는 date 값 "+makeDate);
        
		vo.setTime_wakeup(makeDate);
		vo.setComment(modal_comment);
		vo.setSeq(modal_seq);
		//dao.update(vo);
	}


}
