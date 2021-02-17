package com.mycompany.myapp.web;
import java.io.File;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
//gitlab.com/bcbcbckkk/carrotfriendspring.git
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.PostDTO;
import com.mycompany.myapp.service.MemberService;
import com.mycompany.myapp.service.PostService;
@Controller
public class PostController {
	@Inject
	private PostService postService;
	@Inject MemberService memberService;
	// http://localhost:8080/writeform    <--강사님꺼글쓰러 가기
	@RequestMapping("/writeform")
	public String writeform() {
		return "writeform";
	}// writeform

	// http://localhost:8080/write   : POST 방식		<--강사님꺼글쓰러 가기
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String write(PostDTO dto) {
		//System.out.println("dto=" + dto);
		postService.insertPost(dto); // DB 처리
		return "redirect:/list";
	}

	@RequestMapping("/writePostForm")	// 내꺼 글쓰러 가기
	public String writePostForm() {
		return "writePostForm";
	}
	
	@RequestMapping(value="/writePost", method=RequestMethod.POST)
	public String writePost(PostDTO dto,HttpServletRequest request) {
		HttpSession session = request.getSession();
		//String path="C:/Users/bc033/git/carrotfriendspring/src/main/webapp/resources/img";	//여기는 각자 경로 지정
		String path="C:/Users/basil/git/carrotfriendspring/src/main/webapp/resources/img";	//여기는 각자 경로 지정
		MultipartHttpServletRequest multirequest = (MultipartHttpServletRequest)request;
		MultipartFile file = multirequest.getFile("file");
		String realName = file.getOriginalFilename();
		dto.setImage(realName);
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");//id받아오기
		MemberDTO memberVO =  memberService.detailMember(memberDTO.getId());
		dto.setMemberDTO(memberVO);
		try {
			file.transferTo(new File(path+"/"+realName));
		}catch (Exception e) {
			System.out.println("파일업로드 에러 발생!");
			e.printStackTrace();
		}
		postService.insertPost(dto); 	
		return "redirect:/post/success";		
	}
	@RequestMapping("/post/success")	// 
	public String success() {
		return "/post/success";
	}

	@RequestMapping(value="/deletePost/{postNo}", method=RequestMethod.POST)
	public String deletePost(@PathVariable(value = "postNo") String postNo) {
		//System.out.println(postNo);
		postService.deletePost(postNo);
		return "redirect:/";
	}
	@RequestMapping("/post/updatePostForm/{postNo}")
	public String updatePostForm(@PathVariable(value = "postNo") String postNo,Model model) {
		//System.out.println(postNo);
		PostDTO postDTO= postService.getPostByPostNo(postNo);
		//System.out.println(postDTO);
		model.addAttribute("postDTO",postDTO);
		return "/post/updatePostForm";
	}
	
	@RequestMapping(value="/updatePost", method=RequestMethod.POST)
	public String updatePost(PostDTO postDTO,HttpServletRequest request) {
		HttpSession session = request.getSession();
		//System.out.println(postDTO);
		//String path="C:/Users/bc033/git/carrotfriendspring/src/main/webapp/resources/img";	//여기는 각자 경로 지정
		String path="C:/Users/basil/git/carrotfriendspring/src/main/webapp/resources/img";	//여기는 각자 경로 지정
		MultipartHttpServletRequest multirequest = (MultipartHttpServletRequest)request;
		MultipartFile file = multirequest.getFile("file");
		String realName = file.getOriginalFilename();
		postDTO.setImage(realName);
		
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("memberDTO");//id받아오기
		MemberDTO memberVO =  memberService.detailMember(memberDTO.getId());
		postDTO.setMemberDTO(memberVO);
		try {
			file.transferTo(new File(path+"/"+realName));
		}catch (Exception e) {
			System.out.println("파일업로드 에러 발생!");
			e.printStackTrace();
		}
		postService.updatePost(postDTO);
		return "redirect:/";
	}
}// end
