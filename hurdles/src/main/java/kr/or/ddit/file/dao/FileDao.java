package kr.or.ddit.file.dao;

import java.util.List;
import java.util.Map;

import kr.or.ddit.util.mybatis.MybatisDao;
import kr.or.ddit.vo.FileVo;


public class FileDao extends MybatisDao {
	private static FileDao instance;

	private FileDao() {

	}

	public static FileDao getInstance() {
		if (instance == null) {
			instance = new FileDao();
		}

		return instance;
	}
	
	public int addFiles(List<FileVo> files) {
		return update("file.addFile", files);
	}
	
	public int deleteFiles(int[] removeFileIdList) {
		return update("file.deleteFiles", removeFileIdList);
	}

	public int getFileNo() {
		return selectOne("file.getFileNo");
	}
	
	public List<FileVo> getFileList(int[] fileIds) {
		return selectList("file.getFileList", fileIds);
	};

	public List<FileVo> boardFileList(int boardNo) {
		return selectList("file.boardFileList", boardNo);
	}

	public int addBoardFile(List<Map<String, Object>> param) {
		return insert("file.insertBoardFile", param);
	}
}
