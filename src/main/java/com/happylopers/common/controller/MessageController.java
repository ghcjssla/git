package com.happylopers.common.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.happylopers.board.domain.MessageVO;
import com.happylopers.common.service.MessageService;

@RestController
@RequestMapping("/messages")
public class MessageController {
    
    private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
    
    @Inject
    private MessageService service;
    
    @RequestMapping(value = "/", method = RequestMethod.POST)
    public ResponseEntity<String> addMessage(@RequestBody MessageVO vo){
        logger.info("메시지 호출 됨 ");
        ResponseEntity<String> entitiy = null;
        try {
            service.addMessage(vo);
            entitiy = new ResponseEntity<>("SUCCESS", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entitiy = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }
        return entitiy;
    }

}
