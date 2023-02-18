package com.wolen.memo.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.web.multipart.MultipartFile;

public class FileMangerService {

	
	// 파이 저장 및 클라이언트에서 접근가능한 주소를 만들어서 리턴하는 기능
	public static String saveFile(int userId, MultipartFile file) {
		
		// 파일 저장
		String fileUploadPath ="C:\\Users\\wnwlt\\Desktop\\springProject\\upload\\images";
		
		// 사용자 별로 폴더를 구분한다.
		// 사용자 별로 폴더를 새로 만든다.
		// 폴더이름 : userId_현재시간
		//C:\\Users\\wnwlt\\Desktop\\springProject\\upload\\images\\2_3143135\\adfa.png
		
		String directoryName = "/" + userId + " " + System.currentTimeMillis() + "/";
		
		// 디렉토리 생성
		String directoryPath = fileUploadPath + directoryName;
		File directory = new File(directoryPath);
		if(directory.mkdir()==false) {
			//디렉토리 생성 실패
			return null;
		}
		
		//파일 저장
		try {
			byte[] bytes = file.getBytes();
			
			String filePath = directoryPath + file.getOriginalFilename();
			Path path = Paths.get(filePath);
			Files.write(path, bytes);
			
		} catch (IOException e) {
			e.printStackTrace();
			
			return null;
		}
		
		// 클라이언트에 접근 가능한 경로를 문자열로 리턴
		
		
		// http://local:8080/images/~
		// /images/2_23134123/test.png
		return "/images" + directoryName + file.getOriginalFilename();
		
		
	}
	
}