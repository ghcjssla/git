package com.happylopers.booklog.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/bookLog/*")
public class BookLogController {
	private static final Logger logger = LoggerFactory.getLogger(BookLogController.class);

	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void list(){
	    logger.info("/BookLog/list 호출");
	}
	
	@RequestMapping(value ="/detailBook", method = RequestMethod.GET)
	public void detailBook(){
	    logger.info("/BookLog/detailBook 호출");
	}
}
