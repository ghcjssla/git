package com.happylopers.board.persistence;

import java.util.List;

import com.happylopers.board.domain.BoardVO;
import com.happylopers.board.domain.Criteria;
import com.happylopers.board.domain.SearchCriteria;


public interface BoardDAO {
    public void create(BoardVO vo)throws Exception;
    public BoardVO read(Integer bno)throws Exception;
    public void update(BoardVO vo)throws Exception;
    public void delete(Integer bno)throws Exception;
    public List<BoardVO> listPage(int page)throws Exception;
    public List<BoardVO> listCriteria(Criteria cri)throws Exception;
    public int countPaging(Criteria cri)throws Exception;
    public void updateReplyCnt(Integer bno, int amount) throws Exception;
    public void updateViewCnt(Integer bno)throws Exception;
    
    //검색관련추가
    public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;
    public int listSearchCount(SearchCriteria cri) throws Exception;
    //public List<BoardVO> listALL()throws Exception;
    
    //파일처리
    public void addAttach(String fullName)throws Exception;
    public List<String> getAttach(Integer bno)throws Exception;
    public void deleteAttach(Integer bno)throws Exception;
    public void replaceAttach(String fullname, Integer bno)throws Exception;
    
}
