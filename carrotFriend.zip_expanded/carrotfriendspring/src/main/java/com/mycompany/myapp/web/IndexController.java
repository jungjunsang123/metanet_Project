package com.mycompany.myapp.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.PostDTO;
import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.PostService;

@Controller
public class IndexController {
	@Inject
	private PostService postService;
	@Inject
	private MemberService memberService;
	
	// http://localhost:8080/
	@RequestMapping("/")
	public String index(Model model,HttpServletRequest session) {
		List<PostDTO> list = postService.getPostList();
		String cityNum ="02"; //session 으로 로그인한 멤버의 지역번호 받아오기
		List<MemberDTO> localmemList = memberService.getRecLocalMemberList(cityNum);
		List<MemberDTO> mList = memberService.getRecMemberList();
		model.addAttribute("list",list);
		model.addAttribute("mList",mList);
		model.addAttribute("localmemList",localmemList);
		return "index";
	}// index

}
