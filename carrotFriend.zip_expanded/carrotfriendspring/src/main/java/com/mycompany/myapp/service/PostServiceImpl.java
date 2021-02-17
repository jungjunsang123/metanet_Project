package com.mycompany.myapp.service;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.mycompany.myapp.domain.PostDTO;
import com.mycompany.myapp.persistence.PostDAO;
@Service
public class PostServiceImpl implements PostService {
	@Inject
	private PostDAO postDAO;

	@Override
	public void insertPost(PostDTO dto) {
		postDAO.insertPost(dto);
	}// insertPost

	@Override
	public List<PostDTO> getPostList() {
		return postDAO.getPostList();
	}

	@Override
	public void deletePost(String postNo) {
		 postDAO.deletePost(postNo);
		
	}

	@Override
	public PostDTO getPostByPostNo(String postNo) {
		
		return postDAO.getPostByPostNo(postNo);
	}

	@Override
	public void updatePost(PostDTO postDTO) {
		postDAO.updatePost(postDTO);
		
	}

	
}// end
