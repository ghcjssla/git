package com.happylopers.booklog.service;


import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Service;

import com.happylopers.booklog.domain.BookLogVO;
import com.happylopers.booklog.domain.BookVO;
import com.happylopers.booklog.persistence.BookLogDAO;

@Service
public class BookLogServiceImpl implements BookLogService{
	@Inject BookLogDAO dao;

	@Override
	public List<BookVO> bookList(String mode) throws Exception {
		return dao.Booklist(mode);
	}
	
	@Override
    public Map<String,Integer> selectBookStateNum() throws Exception {
        return dao.selectBookStateNum();
    }

	@Override
	public List<BookLogVO> bookLogList(int book_seq) throws Exception {
		return dao.BookLoglist(book_seq);
	}
	
	public int ReadPagePerDayList(int book_seq) throws Exception {
		
		List<BookLogVO> list = dao.ReadPagePerDayList(book_seq);
	    int average = 0;
	    if(list.size() > 0 ){
	    	average = list.get(0).getLast_page();
		    for (int i = 0; i < list.size()-1 ; i++) {
				average += (list.get(i+1).getLast_page() - list.get(i).getLast_page());
			}
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
	
	public void deleteBookAll(BookLogVO vo) {
		dao.deleteBookLogAll(vo);
		dao.deleteBook(vo);
	}
	
	/**
	 * 개발자 메뉴얼 주소 : https://developers.naver.com/docs/search/blog
	 * query	string	Y	-	검색을 원하는 문자열로서 UTF-8로 인코딩한다.
	 * display	integer	N	10(기본값),100(최대)	검색 결과 출력 건수 지정
	 * start	integer	N	1(기본값), 1000(최대)	검색 시작 위치로 최대 1000까지 가능
	 * sort	string	N	sim(기본값), date	정렬 옵션: sim (유사도순), date (날짜순)
	 */
	public String searchNaverBook(String keyWord, String display, String start) throws Exception{
		String clientSecret = "ZkOeiP7MKx";
		String clientId = "hk2pPjxc3yvhn9NqjqTI";
		String apiLink = "https://openapi.naver.com";
		String appLink = "/v1/search/book.xml";
		String param = appLink+"?query="+keyWord+"&display="+display+"&start="+start;

		
		String url = apiLink+param;
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet request = new HttpGet(url);
		request.addHeader("X-Naver-Client-Id", clientId);
		request.addHeader("X-Naver-Client-Secret", clientSecret);
		HttpResponse response = client.execute(request);
		
        HttpEntity entity = response.getEntity();
        InputStream is = entity.getContent();
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();
        String line = null;
        try{
        while((line=reader.readLine())!=null){
           sb.append(line+"\n");
        }
        }catch(Exception e){
           sb=new StringBuilder();
           sb.append("<item><message>error</message></item>");
        }
        //System.out.println("================리턴결과 출력================");
        //System.out.println(sb.toString());
		return sb.toString();
	}
}
