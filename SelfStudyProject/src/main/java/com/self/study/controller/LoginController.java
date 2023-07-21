package com.self.study.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.self.study.service.LoginService;
import com.self.study.vo.MemberVO;

@Controller
public class LoginController {

	@Autowired
	LoginService service;
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	@GetMapping("loginForm")
	public String loginForm() {
		return "Login/login";
	}
	
	@PostMapping("login")
	public String login(@RequestParam String id, @RequestParam String passwd, Model model, HttpSession session) {
		
		MemberVO member =  service.getMembers(id,passwd);
		
		if(member == null) {
			model.addAttribute("msg","로그인 실패");
			return "fallback";
		}
		
		session.setAttribute("id", id);
		
		model.addAttribute("passwd", passwd);
		
		return "redirect:/";
	}
	
	@GetMapping("logOut")
	public String logOut(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@GetMapping("singUpForm")
	public String singUp() {
		return "Login/SingUp";
	}
	
	@PostMapping("join")
	public String join(@RequestParam String id, @RequestParam String passwd) {
		
		int insertCount = service.insertMember(id,passwd);
		
		return "redirect:/";
	}
	
	
	@PostMapping("loginProcess")
	public String loginProcess(@RequestParam String id, Model model, HttpSession session) {
		logger.info("Welcome" + id);
		
		session.setAttribute("id", id);
		
		return "websoket/createChatRoom";
		
	}
    

	
}
