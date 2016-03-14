package com.happylopers.booklog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;
import com.happylopers.booklog.service.BookLogService;

@Controller
@RequestMapping("/bookLog/*")
public class BookLogController {
	private static final Logger logger = LoggerFactory.getLogger(BookLogController.class);

	@Inject
	private BookLogService service;
	
	@RequestMapping(value ="/list", method = RequestMethod.GET)
	public void list(Model model) throws Exception{
	    logger.info("/BookLog/list 호출");
	    model.addAttribute("list",service.bookList());
	}
	
	@RequestMapping(value ="/detailBook", method = RequestMethod.GET)
	public void detailBook(Model model, int book_seq) throws Exception{
	    logger.info("/BookLog/detailBook 호출");
	    model.addAttribute("bookLog",service.getBookLog(book_seq));
	    model.addAttribute("book",service.getBook(book_seq));
	    model.addAttribute("list",service.bookLogList(book_seq));
	    model.addAttribute("progressRate",service.ReadPagePerDayList(book_seq));
	}
	
	@RequestMapping(value="/registerBook", method = RequestMethod.POST)
    public String registBookPOST(BookVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("책 데이터 등록");
        logger.info(vo.toString());
        
        service.registBook(vo);
        return "redirect:/bookLog/list";
    }
	
	@RequestMapping(value="/registerBookLog", method = RequestMethod.POST)
    public String registBookLogPOST(BookLogVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("책 데이터 등록");
        logger.info(vo.toString());
        
        service.registBookLog(vo);
        return "redirect:/bookLog/detailBook";
    }
	
	@RequestMapping(value="/updateBookLog", method = RequestMethod.POST)
    public String updateBookLogPOST(BookLogVO vo, RedirectAttributes rttr){
		logger.info("책 로그 수정");
		service.updateBookLog(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getSeq();
    }
	
	@RequestMapping(value="/insertBookLog", method = RequestMethod.POST)
    public String insertBookLogPOST(BookLogVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("책 로그 입력");
		service.insertBookLog(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getBook_seq();
    }
	
	@RequestMapping(value="/updateBook", method = RequestMethod.POST)
    public String updateBookPOST(BookVO vo, RedirectAttributes rttr){
		logger.info("책 수정");
		service.updateBook(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getSeq();
    }
	
	@RequestMapping(value="/deleteBookLog", method = RequestMethod.POST)
    public String deleteBookLogPOST(BookLogVO vo, RedirectAttributes rttr){
		logger.info("책 로그 삭제");
		service.deleteBookLog(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getBook_seq();
    }
}
