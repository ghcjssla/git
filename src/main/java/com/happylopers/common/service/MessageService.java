package com.happylopers.common.service;

import com.happylopers.board.domain.MessageVO;

public interface MessageService {

  public void addMessage(MessageVO vo) throws Exception;

  public MessageVO readMessage(String uid, Integer mno) throws Exception;
}
