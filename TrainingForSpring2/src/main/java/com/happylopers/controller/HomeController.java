package com.happylopers.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(RedirectAttributes redirectAttr) {
		redirectAttr.addFlashAttribute("param1", "나의파람");
    	return "redirect:/sboard/list";
	}
	
	@RequestMapping(value ="/test", method = RequestMethod.GET)
	public void ajaxTest(){
	    logger.info("Ajax 테스트 호출");
	}
	
}
