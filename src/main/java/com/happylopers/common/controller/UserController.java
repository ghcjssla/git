package com.happylopers.common.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;

import com.happylopers.board.domain.UserVO;
import com.happylopers.common.service.UserService;
import com.happylopers.dto.LoginDTO;

@Controller
@RequestMapping("/user")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("/login 호출");
	}
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(LoginDTO dto, HttpSession session, Model model)throws Exception{
		logger.info("/loginPost 호출 로그인 시도");
		
		UserVO vo = service.login(dto);
		
		if(vo == null){
			logger.info("잘못된 정보 로그인 실패");
			return;
		}else{
			logger.info("로그인 성공 model.addAttribute(\"userVO\",\"vo\") "+vo.toString());
			model.addAttribute("userVO",vo);
		}
		
		
		
		if(dto.isUseCookie()){
			// 이부분 공통부분 리펙토링 릴요
			int amount = 60 * 60 * 24 * 7;
			
			Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
			service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
		}
		
	}
	
	@RequestMapping(value ="/logout", method = RequestMethod.GET)
	public void logout(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception{
		logger.info("로그아웃 호출");
		Object obj = session.getAttribute("login");
		
		if(obj != null){
			logger.info("로그아웃  로직진행 ");
			UserVO vo = (UserVO)obj;
			
			session.removeAttribute("login");
			session.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			
			if (loginCookie != null) {
				logger.info("쿠키삭제진행");
				//패스가 제대로 적용이 안될시 쿠키는 삭제 안됨
				loginCookie.setPath("/springBoard");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUid(), session.getId(), new Date());
			}
		}
		response.sendRedirect("/springBoard/user/login");
	}
}
