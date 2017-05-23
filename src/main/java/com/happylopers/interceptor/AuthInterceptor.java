package com.happylopers.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.happylopers.board.domain.UserVO;
import com.happylopers.common.service.UserService;


public class AuthInterceptor extends HandlerInterceptorAdapter{
	@Inject
	private UserService service;
	  
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Value("#{propGlobal['APP_ROOT']}")
    private String APP_ROOT="springBoard";
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		logger.info("로그인 체크 인터셉터");
		HttpSession session = request.getSession();
		
		if(session.getAttribute("login") == null){
			logger.info("현재 사용자 로그인중이 아님");
			
			savePreURI(request);
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if(loginCookie != null){
				UserVO userVO = service.checkLoginBefore(loginCookie.getValue());
				
				logger.info("USERVO : "+userVO);
				
				if(userVO != null){
					session.setAttribute("login", userVO);
					return true;
				}
			}
			
			response.sendRedirect("/"+APP_ROOT+"/user/login");
			return false;
		}
		return true;
	}
	
	private void savePreURI(HttpServletRequest req){
		String uri = req.getRequestURI();
		String query = req.getQueryString();
		
		if(query == null || query.equals("null")){
			query = "";
		}else{
			query = "?" + query;
		}
		
		if(req.getMethod().equals("GET")){
			logger.info("방금전 URI "+(uri + query));
			req.getSession().setAttribute("preURI", (uri + query));
		}
	}
	
}
