package com.wolen.memo.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.wolen.memo.post.model.Post;

@Repository
public interface PostDAO {
	
	public int insertPost(@Param("userId") int userId
				, @Param("title") String title
				, @Param("content") String content
				, @Param("file") MultipartFile file
				, @Param("imagePath") String imagePath);
	
	public List<Post> selectPostList(@Param("userId") int userId);
	
	public Post selectPost(@Param("postId") int postId);
	
}
