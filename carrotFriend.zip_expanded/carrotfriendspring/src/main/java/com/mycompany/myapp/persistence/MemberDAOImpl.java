package com.mycompany.myapp.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mycompany.myapp.domain.MemberDTO;
import com.mycompany.myapp.domain.PostDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.mycompany.myapp.mapper.MemberMapper";

	@Override
	public void registerMember(MemberDTO memberDTO) {
		sqlSession.insert(namespace + ".registerMember", memberDTO);
	}

	@Override
	public List<PostDTO> listFeed(String nickName) {

		return sqlSession.selectList(namespace + ".listFeed", nickName);
	}

	@Override
	public MemberDTO detailMember(String id) {

		return sqlSession.selectOne(namespace + ".detailMember", id);
	}

	@Override
	public MemberDTO login(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + ".login", memberDTO);
	}

	@Override
	public String idcheckAjax(String id) {

		return sqlSession.selectOne(namespace + ".idcheckAjax", id);
	}

	@Override
	public void updateMember(MemberDTO memberDTO) {
		sqlSession.update(namespace + ".updateMember", memberDTO);

	}

	@Override
	public String nickcheckAjax(String nickName) {

		return sqlSession.selectOne(namespace + ".nickcheckAjax", nickName);
	}

	public List<MemberDTO> getRecMemberList() {
		return sqlSession.selectList(namespace + ".getRecMemberList");
	}

	@Override
	public List<MemberDTO> getRecLocalMemberList(String cityNum) {
		return sqlSession.selectList(namespace+".getRecLocalMemberList",cityNum);
	}
	
	@Override
	public List<MemberDTO> getAllLocMember(HashMap<String, Integer> map) {
		return sqlSession.selectList(namespace + ".getAllLocMember", map);
	}

	@Override
	public int countMember() {
		return sqlSession.selectOne(namespace + ".countMember");
	}

	@Override
	public List<MemberDTO> getMyLocMember(HashMap<String, Object> map) {
		return sqlSession.selectList(namespace+".getMyLocMember",map);
	}

	@Override
	public int countMember(String cityNum) {
		return sqlSession.selectOne(namespace + ".countMember2",cityNum);
	}
	
}
