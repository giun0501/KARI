package com.human.util;

import java.io.File;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.FileSystemResource;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class FileDataUtil {
	// 1.컨트롤러가 받은 첨부파일을 내가 원하는 곳에 (servlet_context uploadPath로 지정한 곳) 저장
	// 2.파일을 유니크하게 재정의 함 (중복되는 파일명 방지)

	@Resource(name = "uploadPath")
	private String uploadPath;

	// 매핑작성할 예정

	@RequestMapping(value = "/download", method = RequestMethod.GET)

	@ResponseBody
	public FileSystemResource download(@RequestParam("filename") String filename, HttpServletResponse re)
			throws Exception {

		File file = new File(uploadPath + "/" + filename);
		re.setContentType("application/download); utf-8");
		re.setHeader("Content-Disposition", "attachment; filename=" + filename);

		return new FileSystemResource(file);

	}

	public String[] fileUpload(MultipartFile[] file) throws Exception {
		String[] saveName = new String[file.length];
		// 디버깅
//		System.out.println("file 객체 : " + file); // null 인지 판단
//		System.out.println("file 사이즈 : " + file.length); // 길이판단
//		for (int i = 0; i < file.length; i++) {
//			System.out.println(file[i].getOriginalFilename()); // 배열로 오는것 확인 }
//		}

		if (file[0].getOriginalFilename() != "") {
			String orName = file[0].getOriginalFilename();
			UUID uid = UUID.randomUUID(); // 랜덤문자
			saveName[0] = uid.toString() + "." + StringUtils.getFilenameExtension(orName); // 확장자
			// 파일명에는 .이들어가면 안됨.
			byte[] fileData = file[0].getBytes(); // 첨부파일 byte에 저장

			File target = new File(uploadPath, saveName[0]); // 폴더위치에 파일생성
			FileCopyUtils.copy(fileData, target); // 바이트 복사
		}

//		if (file[0].getOriginalFilename() != "") {
//			String orName = file[0].getOriginalFilename();
//			UUID uid = UUID.randomUUID(); // 랜덤문자
//			saveName = uid.toString() + "." + StringUtils.getFilenameExtension(orName); // 확장자
//			// 파일명에는 .이들어가면 안됨. byte[] fileData = file[0].getBytes(); //첨부파일 byte에 저장
//
//			File target = new File(uploadPath, saveName); // 폴더위치에 파일생성
//			FileCopyUtils.copy(fileData, target); // 바이트 복사
//
//		}

		return saveName;
	}

}