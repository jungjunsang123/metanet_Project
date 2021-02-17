package com.mycompany.myapp.web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.PostDTO;
import com.mycompany.myapp.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private MemberService memberService;

	@RequestMapping("/loginForm")
	public String loginform() {
		return "/member/loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request) {
		String res = "member/loginFail";
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		MemberDTO dto = new MemberDTO();
		dto.setId(id);
		dto.setPassword(pw);
		MemberDTO memberDTO = memberService.login(dto);
		//System.out.println(memberDTO);
		if (memberDTO != null) {
			HttpSession session = request.getSession();
			session.setAttribute("memberDTO", memberDTO);
			res = "redirect:/";
		}
		return res;
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	@RequestMapping("/registerMemberForm")
	public String registerForm() {
		return "/member/registerMemberForm";
	}

	@RequestMapping(value = "registerMember", method = RequestMethod.POST)
	public String registerMember(MemberDTO memberDTO) {
		// System.out.println(memberDTO);
		String id = memberDTO.getId();
		String nickname = memberDTO.getNickName();
		//for(int i=0 ; i<100 ; i++) {
		//	memberDTO.setId(id+i);
		//	memberDTO.setNickName(nickname+i);
			memberService.registerMember(memberDTO);
		//}
		return "redirect:/";
	}

	@RequestMapping("/goMemberFeed/{nickName}")
	public String goMemberFeedForm(@PathVariable(value = "nickName") String nickName, Model model) {
		List<PostDTO> list = memberService.listFeed(nickName);
		model.addAttribute("list", list);
		model.addAttribute("nickName",nickName);
		return "/member/goMemberFeedForm";
	}
	
	@RequestMapping("/detailMember/{id}")
	public String deatilMemberForm(@PathVariable(value = "id") String id, Model model) {
		MemberDTO memberDTO = memberService.detailMember(id);
		model.addAttribute("memberDTO", memberDTO);
		return "/member/detailMemberForm";
	}


	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(MemberDTO memberDTO,HttpServletRequest request) {
		HttpSession session = request.getSession();
		memberService.updateMember(memberDTO);
		memberDTO= memberService.detailMember(memberDTO.getId());
		//System.out.println(memberDTO);
		if (memberDTO.getUpdateDate() == null) {
			return "member/loginFail";
		}
		session.invalidate();

		return "redirect:/";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idcheckAjax/{id}", method = RequestMethod.GET)
	public String idcheckAjax(@RequestParam("id") String id) {
		return memberService.idcheckAjax(id);
	}
	 
	@ResponseBody
	@RequestMapping(value = "/nickcheckAjax/{nickName}", method = RequestMethod.GET)
	public String nickcheckAjax(@RequestParam("nickName") String nickName) {
		return memberService.nickcheckAjax(nickName);
	}
	// @PathVariable(value = "id")

	
	@RequestMapping("/getAllLocMember")
	public String getAllMember0() {
		return "redirect:/member/getAllLocMember/1";
	}
	
	@RequestMapping("/getAllLocMember/{pg}")
	public String getAllMember(@PathVariable(value="pg") int pg, Model model) {
		int size = 10; // 글의 수(한 페이지 기준)
		int begin = (pg-1) * size + 1; // 2-1 => 1 * 10 => 10 + 1 => 11
		int end = begin + (size-1);  // 11 + (10-1) => 11 + 9 => 20
		int count = memberService.countMember();
		int totalPage = count / size + (count % size == 0 ? 0 : 1);
		int pageSize = 5; // 페이지 링크 갯수, [11] [12] [13] [14] [15] [16] [17] [18] [19] [20]
		int startPage = ((pg-1) / pageSize * pageSize) + 1; // ((20-1)/10*10)+1=11
		int endPage = startPage + (pageSize-1); // 11+(10-1) => 11+9 => 20
		if(endPage > totalPage) { // 20 > 17
			endPage = totalPage; // 17
		}
		int max = count - ((pg-1) * size); // 각 페이지의 최대 글번호
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		List<MemberDTO> list = memberService.getAllLocMember(map);
		// model 에 정보들을 담는다.
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("max", max);
		return "/member/getAllLocMember";
	}
	
	@RequestMapping("/getMyLocMember/{myloc}")
	public String getMyLocMember0(@PathVariable(value="myloc") String myloc) {
		return "redirect:/member/getMyLocMember/{myloc}/1";
	}
	
	@RequestMapping("/getMyLocMember/{myloc}/{pg}")
	public String getMyLocMember(@PathVariable(value="myloc") String myloc,
			@PathVariable(value="pg") int pg, Model model) {
		int size = 10; // 글의 수(한 페이지 기준)
		int begin = (pg-1) * size + 1; // 2-1 => 1 * 10 => 10 + 1 => 11
		int end = begin + (size-1);  // 11 + (10-1) => 11 + 9 => 20
		int count = memberService.countMember(myloc);
		int totalPage = count / size + (count % size == 0 ? 0 : 1);
		int pageSize = 5; // 페이지 링크 갯수, [11] [12] [13] [14] [15] [16] [17] [18] [19] [20]
		int startPage = ((pg-1) / pageSize * pageSize) + 1; // ((20-1)/10*10)+1=11
		int endPage = startPage + (pageSize-1); // 11+(10-1) => 11+9 => 20
		if(endPage > totalPage) { // 20 > 17
			endPage = totalPage; // 17
		}
		int max = count - ((pg-1) * size); // 각 페이지의 최대 글번호
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("cityNum",myloc);
		List<MemberDTO> list = memberService.getMyLocMember(map);
//		// model 에 정보들을 담는다.
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("max", max);
		model.addAttribute("cityNum", myloc);
		//System.out.println("endPage" + endPage);
		//System.out.println("totalPage" + totalPage);
		return "/member/getMyLocMember";
	}
	
}
