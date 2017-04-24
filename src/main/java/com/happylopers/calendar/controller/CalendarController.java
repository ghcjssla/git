package com.happylopers.calendar.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happylopers.board.domain.UserVO;
import com.happylopers.wakeup.domain.WakeUpVO;
import com.happylopers.wakeup.service.WakeUpService;

@Controller
@RequestMapping("/calendar/*")
public class CalendarController {
	private static final Logger logger = LoggerFactory.getLogger(CalendarController.class);
	@Inject
	private WakeUpService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String root(Model model, RedirectAttributes rttr) throws Exception {
		return "redirect:/calendar/main";
	}
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void main(Model model,  HttpSession session) throws Exception {
		logger.info("캘린더 ");
		Object obj = session.getAttribute("login");
		UserVO vo;
		//임시로 비로그인시 관리자 데이터 보여줌
		if(null == obj){
			vo = new UserVO();
			vo.setUid("ghcjssla");
		}else{
			vo = (UserVO)obj;
		}
		
		model.addAttribute("latestDateInfo",service.selectLatestDateInfo(vo));
		model.addAttribute("wakeUplist",service.list(vo));
	}
	/*
    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String registPOST(WakeUpVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("기상 데이터 등록");
        logger.info(vo.toString());
        
        service.regist(vo);
        return "redirect:/calendar/list";
    }
    
    @RequestMapping(value="/register", method = RequestMethod.GET)
    public void registGET() throws Exception{
    	logger.info("등록 GET 들어옴");
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(WakeUpVO vo, RedirectAttributes rttr)throws Exception{
        logger.info("기상 일지 삭제 시퀀스  : "+vo.getSeq());
        service.remove(vo);
        
        return "redirect:/calendar/list";
    }
    
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(@RequestParam("modal_date") String modal_date, @RequestParam("modal_comment") String modal_comment, @RequestParam("modal_seq") int modal_seq,  RedirectAttributes rttr) throws Exception{
        logger.info("기상 일지  수정 POST");
        //System.out.println("modal_date,modal_comment,modal_seq "+modal_date+" "+modal_comment+" "+modal_seq);
        service.modify(modal_date,modal_comment,modal_seq);
        return "redirect:/calendar/list";
    }
    */
	
	/*@RequestMapping(value="/goSleep", method = RequestMethod.POST)
    public String goSleepPOST(WakeUpVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("취침 데이터 등록"+vo.toString());
        
        service.insertGoSleep(vo);
        return "redirect:/calendar/main";
    }*/
    
    @RequestMapping(value="/wakeUp", method = RequestMethod.POST)
    public String wakeUpPOST(WakeUpVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("기상 데이터 등록" +vo.toString());
        
        //service.updateWakeUp(vo);
        service.insertWakeUp(vo);
        return "redirect:/calendar/main";
    }
    
    
    
    
}