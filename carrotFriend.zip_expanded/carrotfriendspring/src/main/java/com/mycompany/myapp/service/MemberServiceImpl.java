package com.mycompany.myapp.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.PostDTO;
import com.mycompany.myapp.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	private MemberDAO memberDAO;

	@Override
	public void registerMember(MemberDTO memberDTO) {
		memberDAO.registerMember(memberDTO);

	}

	@Override
	public List<PostDTO> listFeed(String nickName) {
		
		return memberDAO.listFeed(nickName);
	}

	@Override
	public MemberDTO detailMember(String id) {
		
		return memberDAO.detailMember(id);
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return memberDAO.login(memberDTO);
	}

	@Override
	public String idcheckAjax(String id) {
		String check = memberDAO.idcheckAjax(id);
		int count = Integer.parseInt(check);
		//System.out.println(count);
		return (count == 0) ? "ok" : "fail";
		
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		
		memberDAO.updateMember(memberDTO);
	}

	@Override
	public String nickcheckAjax(String nickName) {
		String check =  memberDAO.nickcheckAjax(nickName);
		int count = Integer.parseInt(check);
		return (count == 0) ? "ok" : "fail";
	}
	public List<MemberDTO> getRecMemberList() {
		return memberDAO.getRecMemberList();
	}

	@Override
	public List<MemberDTO> getRecLocalMemberList(String cityNum) {
		return memberDAO.getRecLocalMemberList(cityNum);
	}
	public List<MemberDTO> getAllLocMember(HashMap<String, Integer> map) {
		return memberDAO.getAllLocMember(map);
	}

	@Override
	public int countMember() {
		return memberDAO.countMember();
	}

	@Override
	public List<MemberDTO> getMyLocMember(HashMap<String, Object> map) {
		return memberDAO.getMyLocMember(map);
	}

	@Override
	public int countMember(String cityNum) {
		return memberDAO.countMember(cityNum);
	}

}
