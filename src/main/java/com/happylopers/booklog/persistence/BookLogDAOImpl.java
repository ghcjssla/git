package com.happylopers.booklog.persistence;

import java.awt.print.Book;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.happylopers.board.domain.UserVO;
import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;

@Repository
public class BookLogDAOImpl implements BookLogDAO{
	@Inject SqlSession session;

	private static String namespace = "com.happylopers.mapper.booklog.bookLogMapper";

	@Override
	public List<BookVO> Booklist(BookVO vo) throws Exception {
		return session.selectList(namespace+".bookList", vo);
	}
	
	
	@Override
    public Map<String,Integer> selectBookStateNum(BookVO vo) throws Exception {
        return session.selectOne(namespace+".selectBookStateNum", vo);
    }

	@Override
	public List<BookLogVO> BookLoglist(BookLogVO vo) throws Exception {
		return session.selectList(namespace+".bookLogList", vo);
	}
	
	@Override
	public List<BookLogVO> ReadPagePerDayList(BookVO vo) throws Exception {
		return session.selectList(namespace+".selectReadPagePerDay", vo);
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
	public BookVO getBook(BookVO vo) throws Exception {
		return session.selectOne(namespace+".selectBook", vo);
	}
	
	@Override
	public BookLogVO getBookLog(BookLogVO vo) throws Exception {
		return session.selectOne(namespace+".selectBookLog", vo);
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
	public void updateBookReport(BookVO vo) {
		session.update(namespace + ".updateBookReport", vo);
	}

	@Override
	public void deleteBooklog(BookLogVO vo) {
		session.update(namespace + ".deleteBookLog", vo);
	}
	
	@Override
	public void deleteBookLogAll(BookLogVO vo) {
		session.update(namespace + ".deleteBookLogAll", vo);
	}
	

	@Override
	public void deleteBook(BookLogVO vo) {
		session.update(namespace + ".deleteBook", vo);
	}

}
