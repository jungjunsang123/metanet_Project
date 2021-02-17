package com.mycompany.myapp.persistence;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.mycompany.myapp.domain.PostDTO;
@Repository
public class PostDAOImpl implements PostDAO {
	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.mycompany.myapp.mapper.PostMapper";
	@Override
	public void insertPost(PostDTO dto) {
		sqlSession.insert(namespace+".insertPost", dto);
	}// insertPost
	@Override
	public List<PostDTO> getPostList() {
		return sqlSession.selectList(namespace+".getPostList");
	}
	@Override
	public void deletePost(String postNo) {
		sqlSession.delete(namespace+".deletePost", postNo);
		
	}
	@Override
	public PostDTO getPostByPostNo(String postNo) {
		
		return sqlSession.selectOne(namespace+".getPostByPostNo", postNo);
	}
	@Override
	public void updatePost(PostDTO postDTO) {
		sqlSession.update(namespace+".updatePost", postDTO);
		
	}
	
}// end
