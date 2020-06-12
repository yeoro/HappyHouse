package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ssafy.happyhouse.util.FileRepository;


@Controller
public class BoardController {
    //https://docs.spring.io/spring-boot/docs/current/reference/htmlsingle/#legal
	
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/write")
	public String form() {
		return "write";
	}
	
	@PostMapping("/write")
	public String write(@RequestParam("filename") MultipartFile multipartFile, Model model) {
		//MultipartFile : 사용자 PC의 업로드된 스트림정보를 저장
		if (multipartFile != null && !multipartFile.isEmpty()) {
			String originFilename = multipartFile.getOriginalFilename();
			
			String realPath = servletContext.getRealPath("/upload");
			//realPath를 구하는 이유!! ---> 파일은 http방식으로 저장되는 것이 아니라 
			//                          서버의 하드디스크 전체경로에 맞추어서 저장
			
			System.out.println(realPath);
			Map<String, String> map = FileRepository.saveFile(multipartFile, realPath);
			String saveFolder = map.get("saveFolder");
			String saveFilename = map.get("saveFileName");

			model.addAttribute("saveFolder", saveFolder);
			model.addAttribute("saveFilename", saveFilename);
			model.addAttribute("originFilename", originFilename);
		}
//		model.addAttribute("article", boardDto);
		return "writeinfo";
	}
	
}
