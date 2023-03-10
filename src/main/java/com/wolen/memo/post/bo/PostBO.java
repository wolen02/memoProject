package com.wolen.memo.post.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wolen.memo.common.FileMangerService;
import com.wolen.memo.post.dao.PostDAO;
import com.wolen.memo.post.model.Post;

@Service
public class PostBO {

	@Autowired
	private PostDAO postDAO;
	
	public int addPost(int userId, String title, String content, MultipartFile file) {
		
		String imagePath = FileMangerService.saveFile(userId, file);
		
		return postDAO.insertPost(userId, title, content, file, imagePath);
	}
	
	public List<Post> getPostList(int userId){
		
		return postDAO.selectPostList(userId);
		
	}
	
	public Post getPost(int postId) {
		
		return postDAO.selectPost(postId);
	}
}
