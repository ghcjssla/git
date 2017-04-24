package com.happylopers.booklog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happylopers.board.domain.UserVO;
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
	public void list(Model model, HttpSession session, BookVO vo, @RequestParam(value="mode", defaultValue = "L", required=false)String mode) throws Exception{
	    logger.info("/BookLog/list 호출 mode:"+mode);
	    
	    //임시로 비로그인시 관리자 데이터 보여줌
  		if(null == session.getAttribute("login")){
  			vo.setUid("ghcjssla");
  		}else{
  			UserVO userVO = (UserVO)session.getAttribute("login");
  			vo.setUid(userVO.getUid());
  		}
  		vo.setMode(mode);
	    model.addAttribute("list",service.bookList(vo));
	    model.addAttribute("bookStateNum",service.selectBookStateNum(vo));
	}
	
	@RequestMapping(value ="/detailBook", method = RequestMethod.GET)
	public void detailBook(Model model, BookLogVO bookLogVO, HttpSession session, @RequestParam(value="mode", defaultValue = "L", required=false)String mode) throws Exception{
	    logger.info("/BookLog/detailBook 호출");
	    model.addAttribute("mode", mode);
	    
	    BookVO bookVO = new BookVO();
	    bookVO.setSeq(bookLogVO.getBook_seq());
	    //임시로 비로그인시 관리자 데이터 보여줌
  		if(null == session.getAttribute("login")){
  			bookVO.setUid("ghcjssla");
  			bookLogVO.setUid("ghcjssla");
  		}else{
  			UserVO userVO = (UserVO)session.getAttribute("login");
  			bookVO.setUid(userVO.getUid());
  			bookLogVO.setUid(userVO.getUid());
  		}
		
	    model.addAttribute("bookLog",service.getBookLog(bookLogVO));
	    model.addAttribute("book",service.getBook(bookVO));
	    model.addAttribute("list",service.bookLogList(bookLogVO));
	    model.addAttribute("progressRate",service.ReadPagePerDayList(bookVO));
	}
	
	@RequestMapping(value="/registerBook", method = RequestMethod.POST)
    public String registBookPOST(BookVO vo, RedirectAttributes rttr) throws Exception{
        logger.info("책 데이터 등록");
        logger.info(vo.toString());
        
        service.registBook(vo);
        return "redirect:/bookLog/list";
    }
	
	@RequestMapping(value="/registerBookLog", method = RequestMethod.POST)
    public String registBookLogPOST(BookLogVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
        logger.info("책 데이터 등록");
        logger.info(vo.toString());
        
		//임시로 비로그인시 관리자 데이터 보여줌
		if(null == session.getAttribute("login")){
			vo.setUid("ghcjssla");
		}else{
			UserVO userVO = (UserVO)session.getAttribute("login");
			vo.setUid(userVO.getUid());
		}
        
        service.registBookLog(vo);
        return "redirect:/bookLog/detailBook";
    }
	
	@RequestMapping(value="/updateBookLog", method = RequestMethod.POST)
    public String updateBookLogPOST(BookLogVO vo, HttpSession session, RedirectAttributes rttr){
		logger.info("책 로그 수정");
		//임시로 비로그인시 관리자 데이터 보여줌
		if(null == session.getAttribute("login")){
			vo.setUid("ghcjssla");
		}else{
			UserVO userVO = (UserVO)session.getAttribute("login");
			vo.setUid(userVO.getUid());
		}
	
		service.updateBookLog(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getSeq();
    }
	
	@RequestMapping(value="/insertBookLog", method = RequestMethod.POST)
    public String insertBookLogPOST(BookLogVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
		logger.info("책 로그 입력");
		//임시로 비로그인시 관리자 데이터 보여줌
		if(null == session.getAttribute("login")){
			vo.setUid("ghcjssla");
		}else{
			UserVO userVO = (UserVO)session.getAttribute("login");
			vo.setUid(userVO.getUid());
		}
		service.insertBookLog(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getBook_seq();
    }
	
	@RequestMapping(value="/updateBook", method = RequestMethod.POST)
    public String updateBookPOST(BookVO vo, RedirectAttributes rttr){
		logger.info("책 수정");
		service.updateBook(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getSeq();
    }
	
	@RequestMapping(value="/updateBookReport", method = RequestMethod.POST)
    public String updateBookReportPOST(BookVO vo, RedirectAttributes rttr) throws Exception{
		logger.info("책 후기 입력,수정,삭제 : "+ vo.getLink()+" "+vo.getLink_name());
		service.updateBookReport(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getSeq();
    }
	
	@RequestMapping(value="/deleteBookLog", method = RequestMethod.POST)
    public String deleteBookLogPOST(BookLogVO vo, HttpSession session, RedirectAttributes rttr){
		logger.info("책 로그 삭제");
		//임시로 비로그인시 관리자 데이터 보여줌
		if(null == session.getAttribute("login")){
			vo.setUid("ghcjssla");
		}else{
			UserVO userVO = (UserVO)session.getAttribute("login");
			vo.setUid(userVO.getUid());
		}
		service.deleteBookLog(vo);
    return "redirect:/bookLog/detailBook?book_seq="+vo.getBook_seq();
    }
	
	@RequestMapping(value="/deleteBookAll", method = RequestMethod.POST)
	public String deleteBookAllPOST(BookLogVO vo, HttpSession session, RedirectAttributes rttr){
		logger.info("책 모든 데이터 삭제");
		//임시로 비로그인시 관리자 데이터 보여줌
		if(null == session.getAttribute("login")){
			vo.setUid("ghcjssla");
		}else{
			UserVO userVO = (UserVO)session.getAttribute("login");
			vo.setUid(userVO.getUid());
		}
		service.deleteBookAll(vo);
		return "redirect:/bookLog/list";
	}
	
	
	@RequestMapping(value="/searchNaverBook", method = RequestMethod.GET)
    public void searchNaverBookGET(HttpServletResponse response, @RequestParam("keyWord")String keyWord, @RequestParam("display")String display, @RequestParam("start")String start) throws Exception{
		logger.info("네이버 책 검색 : "+keyWord);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(service.searchNaverBook(keyWord, display, start));
    }
}
