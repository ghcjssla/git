package com.happylopers.first.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class SampleController4 {
    private static final Logger logger = LoggerFactory.getLogger(SampleController4.class);
    
    @RequestMapping("/doE")
    public String doC(RedirectAttributes rttr){
        logger.info("doE 호출");
        
        rttr.addFlashAttribute("msg","리다이렉트에서 메시지 줄꼐");
        
        return "redirect:/doF";
    }
    
    @RequestMapping("/doF")
    public String doF(String msg){
        logger.info("doF 호출됨 : "+msg);
        
        return "result";
    }
}
