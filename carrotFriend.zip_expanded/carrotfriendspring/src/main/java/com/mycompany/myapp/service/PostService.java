package com.mycompany.myapp.service;

import java.util.List;

import com.mycompany.myapp.domain.PostDTO;

public interface PostService {
	public void insertPost(PostDTO dto);

	public List<PostDTO> getPostList();

	public void deletePost(String postNo);

	public PostDTO getPostByPostNo(String postNo);

	public void updatePost(PostDTO postDTO);
}
