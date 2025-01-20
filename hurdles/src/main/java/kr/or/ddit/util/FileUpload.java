package kr.or.ddit.util;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.vo.FileVo;

public class FileUpload {
	public static String rootPath = Constants.MY_FILE_PATH + "/hurdles/src/main/resources/";
	
	public static String getFileName(Part part) {
		for (String content : part.getHeader("Content-Disposition").split(";")) {
			// 여기 부분 나중에 수정 하기
			if (content.trim().startsWith("filename")) {				
				return content.substring(content.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		
		return null;
	}

	// 디비에 인서트는 리턴 받은 값을 가지고 DAO로 가서 한다.
	public static FileVo fileWrite(HttpServletRequest req, String dirPath) {
		FileVo fileVo = null;
	    FileService fileService = FileService.getInstance();
	    int fileNo = fileService.getFileNo(); // 파일 아이디  (가변)
	    
		// 파일 저장
		File destDir = new File(rootPath + dirPath);
		destDir.mkdir();

		try {
			for (Part part : req.getParts()) {
				String filename = getFileName(part);
				
	            if (!Utils.isNullOrEmpty(filename) && !filename.isEmpty()) {

					String[] token = filename.split("\\.");

					String ext = token[token.length - 1];

					long size = part.getSize();

					String saveName = UUID.randomUUID().toString().replace("-", "");
					FileVo file = new FileVo();
					file.setFileNo(fileNo);
	                file.setFileExt(ext);
	                file.setFileOrgName(filename);
	                file.setFileSaveName(saveName);
	                file.setFilePath(rootPath + dirPath);
	                file.setFileSize(size);
	                file.setFileSn(1);
					
	                part.write(rootPath + dirPath + "/" + saveName);
					fileVo = file;
				}
			}
		} catch (IOException | ServletException e) {
			e.printStackTrace();
		}

		return fileVo;

	}
	
	public static List<FileVo> fileListWrite(HttpServletRequest req, String dirPath) {
	    List<FileVo> fileList = new ArrayList<FileVo>(); // 파일 리스트 생성
	    FileService fileService = FileService.getInstance();
	    
	    int fileSn = 1;
		int fileNo = fileService.getFileNo(); // 게시물 아이디  (가변)

		// 파일 저장
		File destDir = new File(rootPath + dirPath);
		destDir.mkdir();

		try {
			for (Part part : req.getParts()) {
				String filename = getFileName(part);
	            if (!Utils.isNullOrEmpty(filename) && !filename.isEmpty()) {
	                FileVo fileVo = new FileVo();

	                String ext = filename.contains(".") ? filename.substring(filename.lastIndexOf(".") + 1) : "";
	                long size = part.getSize();
	                
	                String saveName = UUID.randomUUID().toString().replace("-", "");

	                fileVo.setFileNo(fileNo);
	                fileVo.setFileExt(ext);
	                fileVo.setFileOrgName(filename);
	                fileVo.setFileSaveName(saveName);
	                fileVo.setFilePath(rootPath + dirPath);
	                fileVo.setFileSize(size);
	                fileVo.setFileSn(fileSn);

	                 part.write(rootPath + dirPath + "/" + saveName);
	                fileList.add(fileVo); // 파일 리스트에 추가
	                
	                fileNo++;
	                fileSn++;
	            }
	        }
	    } catch (IOException | ServletException e) {
	        e.printStackTrace();
	        throw new RuntimeException("파일 업로드 중 에러 발생", e);
	    }
	    
	    return fileList;
	}
}
