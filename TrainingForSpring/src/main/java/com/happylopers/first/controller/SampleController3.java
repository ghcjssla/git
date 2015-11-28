package com.happylopers.first.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.happylopers.first.vo.ProductVO;

@Controller
public class SampleController3 {
    private static final Logger logger = LoggerFactory.getLogger(SampleController3.class);
    
    @RequestMapping("doD")
    public String doC(Model model){
        logger.info("doD 호출");
        
        ProductVO product = new ProductVO("샘플", 10000);
        
        model.addAttribute(product);
        
        
        return "productDetail";
    }
}
