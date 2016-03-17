package com.happylopers.booklog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;
import com.happylopers.booklog.persistence.BookLogDAO;

@Service
public class BookLogServiceImpl implements BookLogService{
	@Inject BookLogDAO dao;

	@Override
	public List<BookVO> bookList() throws Exception {
		return dao.Booklist();
	}

	@Override
	public List<BookLogVO> bookLogList(int book_seq) throws Exception {
		return dao.BookLoglist(book_seq);
	}
	
	public int ReadPagePerDayList(int book_seq) throws Exception {
		
		List<BookLogVO> list = dao.ReadPagePerDayList(book_seq);
System.out.println("1--------"+list);
System.out.println("1-1-------"+list.size());
	    int average = 0;
if(null != list ){
System.out.println("2--------"+list);	
System.out.println("2-1-------"+list.size());

    average = list.get(0).getLast_page();
	    for (int i = 0; i < list.size()-1 ; i++) {
			//System.out.println("=========== day Page:"+ (list.get(i+1).getLast_page()+" - "+ list.get(i).getLast_page() +" : "+(list.get(i+1).getLast_page() - list.get(i).getLast_page())));
			average += (list.get(i+1).getLast_page() - list.get(i).getLast_page());
		}
	    //System.out.println("-------"+average);
	    average/=list.size();
}
		return average;
	}

	@Override
	public void registBook(BookVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void registBookLog(BookLogVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void removeBook(BookVO vo) throws Exception {
		dao.delete(vo);
	}

	@Override
	public void removeBookLog(BookLogVO vo) throws Exception {
		dao.delete(vo);
	}

	@Override
	public void modifyBook(BookVO vo) throws Exception {
		//dao.update(vo);
	}

	@Override
	public void modifyBookLog(BookLogVO vo) throws Exception {
		//dao.update(vo);
	}

	@Override
	public BookVO getBook(int book_seq) throws Exception {
		return dao.getBook(book_seq);
	}

	@Override
	public BookLogVO getBookLog(int book_seq) throws Exception {
		return dao.getBookLog(book_seq);
	}

	@Override
	public void updateBookLog(BookLogVO vo) {
		dao.updateBookLog(vo);
	}

	@Override
	public void insertBookLog(BookLogVO vo) throws Exception {
		dao.create(vo);
	}

	@Override
	public void updateBook(BookVO vo) {
		dao.updateBook(vo);
	}

	@Override
	public void deleteBookLog(BookLogVO vo) {
		dao.deleteBooklog(vo);
	}
}
