package com.happylopers.common.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.happylopers.util.FBConnection;
import org.happylopers.util.FBGraph;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@Autowired
	private FBConnection fbConnection;
	
	@Autowired
	private FBGraph fbGraph;
	
	@Value("#{propGlobal['APP_ROOT']}")
    private String APP_ROOT;
	
	@Value("#{props['fb.login.uri']}")
	private String fbLoginURI;
	//private String fbLoginURI="http://www.happylopers.com/springBoard/user/fbLogin";
	//private String fbLoginURI="http://localhost/springBoard/user/fbLogin";
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto, Model model){
		logger.info("/login 호출 : "+fbLoginURI);
		model.addAttribute("fbURL",fbConnection.getFBAuthUrl(fbLoginURI));
	}
	
	@RequestMapping(value="/loginPost", method = RequestMethod.POST)
	public void loginPOST(HttpServletRequest request, LoginDTO dto, HttpSession session, Model model)throws Exception{
		String Referer = request.getHeader("referer");
		logger.info("/loginPost 호출 로그인 시도 "+Referer);
		loginProc(dto, session, model);
	}

	@RequestMapping(value="/fbLogin", method = RequestMethod.GET)
	public String fbLoginGET(HttpServletRequest request, HttpSession session, Model model, LoginDTO dto) throws Exception{
		String code = request.getParameter("code");
		if (code == null || code.equals("")) {
			throw new RuntimeException(
					"ERROR: Didn't get code parameter in callback.");
		}
		String accessToken = fbConnection.getAccessToken(code,fbLoginURI);
		String graph = fbGraph.getFBGraph(accessToken);
		JSONObject jsonObject = fbGraph.getGraphJsonData(graph);
		dto.setFbid(jsonObject.get("id").toString());
		loginProc(dto, session, model);
		return "/bookLog/list";
	}
	
	private void loginProc(LoginDTO dto, HttpSession session, Model model) throws Exception {
		UserVO vo = new UserVO();
		if(!dto.getFbid().isEmpty()){
			logger.info("/loginPost 호출 페이스북 로그인 : "+dto.getFbid());
			vo = service.loginFB(dto);
		}else{
			logger.info("/loginPost 호출 로그인 : "+dto.getFbid());
			vo = service.login(dto);
		}
		
		if(vo == null){
			logger.info("잘못된 정보 로그인 실패");
		}else{
			logger.info("로그인 성공 model.addAttribute(\"userVO\",\"vo\") "+vo.toString());
			model.addAttribute("userVO",vo);
			
			if(dto.isUseCookie()){
				// 이부분 공통부분 리펙토링 릴요
				int amount = 60 * 60 * 24 * 7;
				
				Date sessionLimit = new Date(System.currentTimeMillis()+(1000*amount));
				service.keepLogin(vo.getUid(), session.getId(), sessionLimit);
			}
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
				loginCookie.setPath("/"+APP_ROOT);
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUid(), session.getId(), new Date());
			}
		}
		response.sendRedirect("/"+APP_ROOT+"/user/login");
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET(@ModelAttribute("dto") LoginDTO dto){
		logger.info("/register 호출");
	}
	
	@RequestMapping(value = "/joinTheHappyLopers", method = RequestMethod.POST)
	@ResponseBody
	public boolean joinTheHappyLopers(@ModelAttribute("vo") UserVO vo) throws Exception{
		logger.info("/joinTheHappyLopers 호출 vo.getEmail() : "+vo.getEmail());
		boolean success = false;
		success = service.joinTheHappyLopers(vo);
		logger.info("/joinTheHappyLopers 호출 success: "+success);
		return success;
	}
	
	@RequestMapping(value = "/checkDuplicatedUserWithFacebook", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkDuplicatedUserWithFacebookPOST(@ModelAttribute("dto") LoginDTO dto) throws Exception{
		logger.info("/checkDuplicatedUserWithFacebookPOST 호출 dto  : "+dto.getFbid());
		//유저가있으면 flase 없으면 true
		return service.checkDuplicatedUserWithFacebook(dto.getFbid());
	}
	
	
	@RequestMapping(value = "/checkDuplicatedUserId", method = RequestMethod.POST)
	@ResponseBody
	public boolean checkDuplicatedUserId(@ModelAttribute("dto") LoginDTO dto) throws Exception{
		logger.info("/checkDuplicatedUserId 호출 dto  : "+dto.getUid());
		//유저가있으면 flase 없으면 true
		return service.checkDuplicatedUserId(dto.getUid());
	}
	
	

}
