package kr.or.ddit.file.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.or.ddit.file.dao.FileDao;
import kr.or.ddit.vo.FileVo;


public class FileService {
	private static FileService instance;

	private FileService() {

	}

	public static FileService getInstance() {
		if (instance == null) {
			instance = new FileService();
		}

		return instance;
	}
	
	private FileDao fileDao = FileDao.getInstance();

	public int addFiles(List<FileVo> files) {
		return fileDao.addFiles(files);
	}
	
	public int deleteFiles(int[] removeFileIdList) {
		return fileDao.deleteFiles(removeFileIdList);
	}
	
	public int getFileNo( ) {
		return fileDao.getFileNo();
	}
	
	public List<FileVo> getFileList(int[] fileIds) {
		return fileDao.getFileList(fileIds);
	};
	
	public List<FileVo> boardFileList(int boardNo) {
		return fileDao.boardFileList(boardNo);
	}
	
	public int addBoardFile(List<FileVo> fileList, int boardNo) {
		List<Map<String, Object>> param = new ArrayList<Map<String, Object>>();
		for(FileVo file : fileList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("board_no", boardNo);
			map.put("file_no", file.getFileNo());
			param.add(map);
		}
		
		return fileDao.addBoardFile(param);
	}
}
