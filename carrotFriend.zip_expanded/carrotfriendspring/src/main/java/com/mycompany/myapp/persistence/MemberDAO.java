package com.mycompany.myapp.persistence;

import java.util.HashMap;
import java.util.List;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.PostDTO;

public interface MemberDAO {

	public void registerMember(MemberDTO memberDTO);

	public List<PostDTO> listFeed(String nickName);

	public MemberDTO detailMember(String id);

	public MemberDTO login(MemberDTO memberDTO);

	public String idcheckAjax(String id);

	public void updateMember(MemberDTO memberDTO);

	public String nickcheckAjax(String nickName);
	
	public List<MemberDTO> getRecMemberList();

	public List<MemberDTO> getRecLocalMemberList(String cityNum);

	public List<MemberDTO> getAllLocMember(HashMap<String, Integer> map);

	public int countMember();
	
	public int countMember(String cityNum);

	public List<MemberDTO> getMyLocMember(HashMap<String, Object> map);

}
