package com.happylopers.booklog.persistence;

import java.util.List;
import java.util.Map;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;

public interface BookLogDAO {
	public BookVO getBook(BookVO vo) throws Exception;
	public BookLogVO getBookLog(BookLogVO vo) throws Exception;
	public List<BookVO> Booklist(BookVO vo) throws Exception;
	public List<BookLogVO> BookLoglist(BookLogVO vo) throws Exception;
	public void create(BookVO vo)throws Exception;
	public void create(BookLogVO vo)throws Exception;
	public void delete(BookVO vo)throws Exception;
	public void delete(BookLogVO vo)throws Exception;
	public void update(BookVO vo)throws Exception;
	public void update(BookLogVO vo)throws Exception;
	public void updateBookLog(BookLogVO vo);
	public void updateBook(BookVO vo);
	public void updateBookReport(BookVO vo);
	public void deleteBook(BookLogVO vo);
	public void deleteBooklog(BookLogVO vo);
	public void deleteBookLogAll(BookLogVO vo);
	List<BookLogVO> ReadPagePerDayList(BookVO vo) throws Exception;
	public Map<String, Integer> selectBookStateNum(BookVO vo) throws Exception;
}
