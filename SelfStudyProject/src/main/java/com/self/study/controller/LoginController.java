package com.self.study.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@GetMapping("login")
	public String login() {
		return "websoket/login";
	}
	
	
	@PostMapping("loginProcess")
	public String loginProcess(@RequestParam String id, Model model, HttpSession session) {
		logger.info("Welcome" + id);
		
		session.setAttribute("id", id);
		
		return "websoket/createChatRoom";
		
	}
	
    @GetMapping("chatRoom")
    public ModelAndView enterChatRoom(String roomId) {
        ModelAndView modelAndView = new ModelAndView("websoket/chat");
        System.out.println(roomId);
        modelAndView.addObject("roomId", roomId);
        return modelAndView;
    }
	
}
