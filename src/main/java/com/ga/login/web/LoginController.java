package com.ga.login.web;
 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ga.common.LoginVO;
import com.ga.login.service.impl.LoginDAO;
import com.ga.login.service.impl.LoginDAOImpl;
import com.ga.login.service.impl.LoginService;
import com.ga.member.service.MemberVO;
import com.ga.member.service.impl.MemberDAO;
import com.ga.member.service.impl.MemberDAOImpl;
import com.ga.util.SHA;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
 
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
 
 
@Controller // 현재 클래스를 스프링에서 관리하는 컨트롤러 bean으로 생성
@RequestMapping("/login/*") // 모든맵핑은 /member/를 상속
public class LoginController {
    // 로깅을 위한 변수
    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    
    @Inject
    LoginService loginService;
    SHA sha = new SHA();
    // 01. 로그인 화면 
    @RequestMapping("login.do")
    public String login(){
        return "login/loginForm";    // views/member/login.jsp로 포워드
    }
    
    // 02. 로그인 처리
    @RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
//    public ModelAndView loginCheck(@ModelAttribute LoginVO vo, HttpSession session)
    public void loginCheck(@ModelAttribute LoginVO vo,
			HttpServletResponse response, HttpSession session) throws IOException {
		  /*
		  boolean result = loginService.loginCheck(vo, session);
		  ModelAndView mav = new ModelAndView();
		  if (result == true) { // 로그인 성공 // main.jsp로 이동
			  mav.setViewName("redirect:/board/boardList.do"); 
			  mav.addObject("msg","success"); 
		  } else { // 로그인 실패 // login.jsp로 이동
			  mav.setViewName("login/loginForm");
			  mav.addObject("msg", "failure"); 
		  } return mav; */
    	 String salt = loginService.getSaltById(vo);
		 String pw_encrypt = sha.SHA512(vo.getUserPw(), salt);
		 vo.setUserPw(pw_encrypt);
         boolean result = loginService.loginCheck(vo,session);
         System.out.println(salt);
         if(result==true) {
        	 
 			response.getWriter().print(true) ;
 		} else {
 			response.getWriter().print(false) ;
 		}
    }
    
    // 03. 로그아웃 처리
    @RequestMapping("logout.do")
    public ModelAndView logout(HttpSession session){
        loginService.logout(session);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/board/boardList.do");
        mav.addObject("msg", "logout");
        return mav;
    }
    
}