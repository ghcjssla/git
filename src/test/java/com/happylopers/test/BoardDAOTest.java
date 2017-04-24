package com.happylopers.test;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.happylopers.board.persistence.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDAOTest {
    @Inject
    private BoardDAO dao;
    private static Logger logger = LoggerFactory.getLogger(BoardDAOTest.class);
    /*
     * 테스트는 개별적으로 실행가능하게 만들어야 한다 로직 변경 필요
    @Test
    public void tesatCreate() throws Exception{
        BoardVO boardVO = new BoardVO();
        boardVO.setTitle("테스트 제목");
        boardVO.setContent("테스트 내용");
        boardVO.setWriter("테스트계정");
        dao.create(boardVO);
    }
    */
    @Test
    public void testRead() throws Exception{
        dao.read(983089);
    }
    /*
    @Test
    public void testUpdate() throws Exception{
        BoardVO boardVO = new BoardVO();
        boardVO.setBno(983057);
        boardVO.setTitle("테스트 제목 수정");
        boardVO.setContent("테스트 내용 수정");
        boardVO.setWriter("테스트계정수정");
        dao.update(boardVO);
    }
    
    @Test
    public void testDelete() throws Exception {
        dao.delete(983057);
    }
    
    /*
    @Test
    public void testURI()throws Exception{
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                .path("/board/read")
                .queryParam("bno", 12)
                .queryParam("perPageNum", 20)
                .build();
        
        logger.info("/board/read?bno=12&perPageNum=20");
        logger.info(uriComponents.toString());
    }
    
    
    @Test
    public void testURI2()throws Exception{
        UriComponents uriComponents =
                UriComponentsBuilder.newInstance()
                .path("/{module}/{page}")
                .queryParam("bno", 12)
                .queryParam("perPageNum", 20)
                .build()
                .expand("board","read")
                .encode();
        
        logger.info("/board/read?bno=12&perPageNum=20");
        logger.info(uriComponents.toString());
    }
    
    
    @Test
    public void testDynamic1() throws Exception{
        SearchCriteria cri = new SearchCriteria();
        cri.setPage(1);
        cri.setKeyword("ㅎㅎ");
        cri.setSearchType("title");
        //cri.setSearchType("writer");
        //cri.setSearchType("content");
        //cri.setSearchType("titleAndContent");
        //cri.setSearchType("contentAndWriter");
        cri.setSearchType("titleORContentORWriter");
        
        
        logger.info("------------------------------");
        
//        List<BoardVO> list = dao.listSearch(cri);
//        
//        for (BoardVO boardVO : list) {
//            logger.info(boardVO.getBno()+" : "+boardVO.getTitle());
//        }
        
        logger.info("------------------------------");
        logger.info("COUNT : "+dao.listSearchCount(cri));
        
    }
    */
}
