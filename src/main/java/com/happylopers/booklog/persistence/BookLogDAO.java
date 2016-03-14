package com.happylopers.booklog.persistence;

import java.util.List;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;

public interface BookLogDAO {
	public BookVO getBook(int book_seq) throws Exception;
	public BookLogVO getBookLog(int book_seq) throws Exception;
	public List<BookVO> Booklist() throws Exception;
	public List<BookLogVO> BookLoglist(int book_seq) throws Exception;
	public void create(BookVO vo)throws Exception;
	public void create(BookLogVO vo)throws Exception;
	public void delete(BookVO vo)throws Exception;
	public void delete(BookLogVO vo)throws Exception;
	public void update(BookVO vo)throws Exception;
	public void update(BookLogVO vo)throws Exception;
	public void updateBookLog(BookLogVO vo);
	public void updateBook(BookVO vo);
	public void deleteBooklog(BookLogVO vo);
	List<BookLogVO> ReadPagePerDayList(int book_seq) throws Exception;
}
