package com.happylopers.booklog.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;

@Repository
public class BookLogDAOImpl implements BookLogDAO{
	@Inject SqlSession session;

	private static String namespace = "com.happylopers.mapper.booklog.bookLogMapper";

	@Override
	public List<BookVO> Booklist() throws Exception {
		return session.selectList(namespace+".bookList");
	}

	@Override
	public List<BookLogVO> BookLoglist(int book_seq) throws Exception {
		return session.selectList(namespace+".bookLogList", book_seq);
	}
	
	@Override
	public List<BookLogVO> ReadPagePerDayList(int book_seq) throws Exception {
		return session.selectList(namespace+".selectReadPagePerDay", book_seq);
	}
	
	

	@Override
	public void create(BookVO vo) throws Exception {
		session.insert(namespace+".createBook", vo);
	}

	@Override
	public void create(BookLogVO vo) throws Exception {
		session.insert(namespace+".createBookLog", vo);
	}

	@Override
	public void delete(BookVO vo) throws Exception {
		session.delete(namespace+".createBook", vo);
	}

	@Override
	public void delete(BookLogVO vo) throws Exception {
		session.delete(namespace+".createBookLog", vo);
	}

	@Override
	public void update(BookVO vo) throws Exception {
		session.update(namespace+".createBook", vo);
	}

	@Override
	public void update(BookLogVO vo) throws Exception {
		session.update(namespace+".createBookLog", vo);
	}

	@Override
	public BookVO getBook(int book_seq) throws Exception {
		return session.selectOne(namespace+".selectBook", book_seq);
	}
	
	@Override
	public BookLogVO getBookLog(int bookLog_seq) throws Exception {
		return session.selectOne(namespace+".selectBookLog", bookLog_seq);
	}

	@Override
	public void updateBookLog(BookLogVO vo) {
		session.update(namespace + ".updateBookLog", vo);
	}

	@Override
	public void updateBook(BookVO vo) {
		session.update(namespace + ".updateBook", vo);
	}

	@Override
	public void deleteBooklog(BookLogVO vo) {
		session.update(namespace + ".deleteBookLog", vo);
	}

}
