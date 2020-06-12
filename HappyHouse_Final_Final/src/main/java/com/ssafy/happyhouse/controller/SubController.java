package com.ssafy.happyhouse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SubController {
	
	@GetMapping(value = "/isafe")
	public ModelAndView isafe() {
		return new ModelAndView("isafe/isafeMain");
	}
	
}
