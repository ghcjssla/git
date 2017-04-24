package com.happylopers.mobile.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happylopers.common.controller.HomeController;

@Controller
public class uhbeeController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/uhbee", method = RequestMethod.GET)
	public String home(RedirectAttributes redirectAttr) {
		logger.info("어비의 모바일웹앱");
    	return "/uhbee/index";
	}
}
