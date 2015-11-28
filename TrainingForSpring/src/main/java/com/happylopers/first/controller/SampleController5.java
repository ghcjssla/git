package com.happylopers.first.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.happylopers.first.vo.ProductVO;

@Controller
public class SampleController5 {
    private static final Logger logger = LoggerFactory.getLogger(SampleController5.class);
    
    @RequestMapping("/doJSON")
    public @ResponseBody ProductVO doJSON(){
        logger.info("doJSON 호출");
        ProductVO vo = new ProductVO("샘플", 9999);
        return vo;
    }
}
