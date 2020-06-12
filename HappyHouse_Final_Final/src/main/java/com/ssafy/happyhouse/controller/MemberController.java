package com.ssafy.happyhouse.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.happyhouse.domain.MemberDto;
import com.ssafy.happyhouse.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired 
	MemberService  memberService;
	
	@GetMapping(value = "/main.do")
	public ModelAndView main() {
		return new ModelAndView("main");
	}
	
	////////////////////////////////////////
	
	@GetMapping(value = "/")
	public ModelAndView home() {
		return new ModelAndView("main");
	}
	
	@GetMapping(value = "/index")
	public ModelAndView home1() {
		return new ModelAndView("login");
	}
	
	@GetMapping(value = "/login")
	public ModelAndView login() {
		return new ModelAndView("login");
	}
	
	@GetMapping(value = "/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		return new ModelAndView("login");
	}

	@PostMapping(value = "/login")
	public ModelAndView login(MemberDto dto, HttpSession session) {
		if (memberService.check(dto) == null) {
			return new ModelAndView("login");
		}
		session.setAttribute("user", memberService.check(dto));
		return new ModelAndView("/main");
	}
	
	////////////////////////////////////////
	
	@GetMapping("/listMeber.do")
	public ModelAndView MemberList(Model model) {
		model.addAttribute("list", memberService.searchAll());
		return new ModelAndView("user/selectall");
	}
	
	@GetMapping("/loginform.do")
	public String loginForm() {
		return "user/loginform";
	}
	
	@GetMapping("/updateForm.do")
	public String updateForm() {
		return "user/updateform";
	}
	
	@GetMapping("/signupform.do")
	public String signupForm() {
		return "user/signupform";
	}
	
	@PostMapping("/update.do")
	public String update(MemberDto member) {
		memberService.update(member);		
		return "user/updatesuccess";
	}
	
	@GetMapping(value = "/delete.do")
	public ModelAndView delete(String id, MemberDto member, HttpSession session) {
		member.setId(id);
		memberService.delete(member);	
		session.invalidate();
		return new ModelAndView("login");
	}
	
	@PostMapping("/signup.do")
	public String signup(MemberDto member) {
		memberService.signUp(member);		
		return "user/signupsuccess";
	}
	

}