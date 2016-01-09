package com.happylopers.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.happylopers.board.domain.BoardVO;
import com.happylopers.board.domain.PageMaker;
import com.happylopers.board.domain.SearchCriteria;
import com.happylopers.board.service.BoardService;

@Controller
@RequestMapping("/sboard/*")
public class SearchBoardController {
    private static final Logger logger = LoggerFactory.getLogger(SearchBoardController.class);
    
    @Inject
    private BoardService service;
    
    @RequestMapping(value = "/list",  method = RequestMethod.GET)
    public void ListPage(@ModelAttribute("cri") SearchCriteria cri, Model model, HttpServletRequest req) throws Exception{
        logger.info("검색 리스트 호출 GET "+cri.toString());
        
        //model.addAttribute("list",service.listCriteria(cri));
        model.addAttribute("list",service.listSearchCriteria(cri));
        
        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);
        
        //spageMaker.setTotalCount(service.listCountCriteria(cri));
        
        logger.info("검색 리스트 호출 GET 모델 넘기기 전 검색 갯수 "+service.listSearchCount(cri));
        pageMaker.setTotalCount(service.listSearchCount(cri));
        
        model.addAttribute("pageMaker", pageMaker);
        
        logger.info("리스트에서 쿼리스트링 테스트 : "+req.getQueryString());
        
    }
    
    @RequestMapping(value = "/readPage", method = RequestMethod.GET)
    public void read(@RequestParam("bno") int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
        logger.info("검색 읽기페이지 호출 GET");
        model.addAttribute(service.read(bno));
    }
    
    @RequestMapping(value = "/removePage", method = RequestMethod.POST)
    public String remove(@RequestParam("bno") int bno, SearchCriteria cri, RedirectAttributes rttr)throws Exception{
        logger.info("검색 삭제 POST 게시물 번호  : "+bno);
        service.remove(bno);
        
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("searchType", cri.getSearchType());
        rttr.addAttribute("keyword", cri.getKeyword());
        
        rttr.addFlashAttribute("msg", "SUCCESS");
        
        return "redirect:/sboard/list";
    }
    
    @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
    public void modifyGET(int bno, @ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
        logger.info("검색 수정페이지 호출 GET");
        model.addAttribute(service.read(bno));
    }
    
    @RequestMapping(value = "/modifyPage", method = RequestMethod.POST)
    public String modifyPOST(BoardVO board, SearchCriteria cri, RedirectAttributes rttr) throws Exception{
        logger.info("검색 게시물 수정 POST");
        
        service.modify(board);
        
        rttr.addAttribute("page", cri.getPage());
        rttr.addAttribute("perPageNum", cri.getPerPageNum());
        rttr.addAttribute("searchType", cri.getSearchType());
        rttr.addAttribute("keyword", cri.getKeyword());
        
        rttr.addFlashAttribute("msg", "SUCCESS");
        
        return "redirect:/sboard/list";
    }
    
    @RequestMapping(value = "register", method = RequestMethod.GET)
    public void registerGET(BoardVO board, Model model) throws Exception{
        logger.info("검색 등록 페이지 호출 GET");
    }
    
    @RequestMapping(value="/register", method = RequestMethod.POST)
    public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception{
        logger.info("검색 데이터 등록 POST");
        logger.info(board.toString());
        
        service.regist(board);
        
        rttr.addFlashAttribute("msg","SUCCESS");
        
        return "redirect:/sboard/list";
    }
    
    @RequestMapping("/getAttach/{bno}")
    @ResponseBody
    public List<String> getAttach(@PathVariable("bno")Integer bno)throws Exception{
    	return service.getAttach(bno);
    }
}
