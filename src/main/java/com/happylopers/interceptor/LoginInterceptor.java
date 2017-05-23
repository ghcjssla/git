package com.happylopers.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{
	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Value("#{propGlobal['APP_ROOT']}")
    private String APP_ROOT="springBoard";
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)throws Exception{
		logger.info("로그인 인터셉터 동작 : preHandle");
		HttpSession session = request.getSession();
		
		if(session.getAttribute(LOGIN) != null){
			logger.info("로그인전 데이터 삭제");
			session.removeAttribute(LOGIN);
		}
		return true;
	}
	
	
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView)throws Exception{
		logger.info("로그인 인터셉터 동작 : postHandle");
		HttpSession session = request.getSession();
		
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("userVO");
		
		logger.info("Logininterceptor.postHandle() : "+userVO);
		if(userVO != null){
			logger.info("새로운 로그인 성공");
			//modelMap.addAttribute("userVO",userVO);
			session.setAttribute(LOGIN, userVO);
			logger.info(session.getAttribute(LOGIN).toString());
			
			if (request.getParameter("useCookie") != null) {
				logger.info("자동로그인 기능 사용");
				Cookie loginCookie = new Cookie("loginCookie", session.getId());
				loginCookie.setPath("/"+APP_ROOT);
				//일주일
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(loginCookie);
			}
			
			//return "redirect:/sboard/list";
			//뭔가 있다.
			//그냥 리다이렉트로 때리면 세션이 사라지나...
			//sendRedirect로 때리니까 세션이 유지되네..
			
			//response.sendRedirect("/springBoard/sboard/list");
			
			
			Object preURI = session.getAttribute("preURI");
			logger.info("권한 체크하고 방급 URI로 보내주기 : "+preURI);
			response.sendRedirect(preURI != null ? (String)preURI:"/"+APP_ROOT+"/bookLog/list");
		}
	}
	
}
