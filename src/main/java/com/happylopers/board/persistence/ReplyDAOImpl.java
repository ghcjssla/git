package com.happylopers.board.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.happylopers.board.domain.Criteria;
import com.happylopers.board.domain.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
    
    @Inject
    private SqlSession session;

    private static String namespace = "com.happylopers.mapper.board.ReplyMapper";

    public List<ReplyVO> list(Integer bno) throws Exception {
      return session.selectList(namespace + ".list", bno);
    }

    public void create(ReplyVO vo) throws Exception {

      session.insert(namespace + ".create", vo);
    }

    public void update(ReplyVO vo) throws Exception {

      session.update(namespace + ".update", vo);
    }

    public void delete(Integer rno) throws Exception {

      session.update(namespace + ".delete", rno);
    }

    public List<ReplyVO> listPage(Integer bno, Criteria cri)
        throws Exception {

      Map<String, Object> paramMap = new HashMap<>();

      paramMap.put("bno", bno);
      paramMap.put("cri", cri);

      return session.selectList(namespace + ".listPage", paramMap);
    }

    public int count(Integer bno) throws Exception {

      return session.selectOne(namespace + ".count", bno);
    }

    @Override
    public int getBno(Integer rno) throws Exception {
        return session.selectOne(namespace + ".getBno", rno);
    }

}
