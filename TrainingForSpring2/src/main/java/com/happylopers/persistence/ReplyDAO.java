package com.happylopers.persistence;

import java.util.List;

import com.happylopers.domain.Criteria;
import com.happylopers.domain.ReplyVO;

public interface ReplyDAO {

    List<ReplyVO> list(Integer bno) throws Exception;

    void create(ReplyVO vo) throws Exception;

    void update(ReplyVO vo) throws Exception;

    void delete(Integer rno) throws Exception;

    int count(Integer bno) throws Exception;

    List<ReplyVO> listPage(Integer bno, Criteria cri) throws Exception;
    
    public int getBno(Integer rno) throws Exception;

}
