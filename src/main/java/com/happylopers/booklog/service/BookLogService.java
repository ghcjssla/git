package com.happylopers.booklog.service;

import java.util.List;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;

public interface BookLogService {
	public BookVO getBook(int book_seq) throws Exception;
	public BookLogVO getBookLog(int book_seq) throws Exception;
	public List<BookVO> bookList() throws Exception;
	public List<BookLogVO> bookLogList(int book_seq) throws Exception;
	public void registBook(BookVO vo) throws Exception;
	public void registBookLog(BookLogVO vo) throws Exception;
	public void removeBook(BookVO vo) throws Exception;
	public void removeBookLog(BookLogVO vo) throws Exception;
	public void modifyBook(BookVO vo)throws Exception;
	public void modifyBookLog(BookLogVO vo)throws Exception;
	public void updateBookLog(BookLogVO vo);
	public void insertBookLog(BookLogVO vo) throws Exception;
	public void updateBook(BookVO vo);
	public void deleteBookLog(BookLogVO vo);
}
