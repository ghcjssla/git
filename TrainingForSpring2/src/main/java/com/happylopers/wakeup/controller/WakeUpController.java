package com.happylopers.wakeup.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happylopers.wakeup.domain.WakeUpVO;
import com.happylopers.wakeup.service.WakeUpService;

@Controller
@RequestMapping("/wakeup/*")
public class WakeUpController {
	private static final Logger logger = LoggerFactory.getLogger(WakeUpController.class);
	@Inject
	private WakeUpService service;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String root(Model model, RedirectAttributes rttr) throws Exception {
		return "redirect:/wakeup/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception {
		logger.info("기상일지 리스트 호출 ");
		model.addAttribute("list",service.list());
	}
	
    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String registPOST(WakeUpVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("기상 데이터 등록");
        logger.info(vo.toString());
        
        service.regist(vo);
        return "redirect:/wakeup/list";
    }
    
    @RequestMapping(value="/register", method = RequestMethod.GET)
    public void registGET() throws Exception{
    	logger.info("등록 GET 들어옴");
    }
    
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(WakeUpVO vo, RedirectAttributes rttr)throws Exception{
        logger.info("기상 일지 삭제 시퀀스  : "+vo.getSeq());
        service.remove(vo);
        
        return "redirect:/wakeup/list";
    }
    
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modifyPOST(@RequestParam("modal_date") String modal_date, @RequestParam("modal_comment") String modal_comment, @RequestParam("modal_seq") int modal_seq,  RedirectAttributes rttr) throws Exception{
        logger.info("기상 일지  수정 POST");
        //System.out.println("modal_date,modal_comment,modal_seq "+modal_date+" "+modal_comment+" "+modal_seq);
        service.modify(modal_date,modal_comment,modal_seq);
        return "redirect:/wakeup/list";
    }
}
