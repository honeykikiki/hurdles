package kr.or.ddit.controller.member;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kr.or.ddit.file.service.FileService;
import kr.or.ddit.service.member.MemberService;
import kr.or.ddit.util.FileUpload;
import kr.or.ddit.util.ParamResult;
import kr.or.ddit.util.RequestToVoMapper;
import kr.or.ddit.vo.FileVo;
import kr.or.ddit.vo.MemberVo;

@WebServlet("/site/myPageUpdate.do")
@MultipartConfig
public class MyPageUpdateController extends HttpServlet {
	MemberService memberService = MemberService.getInstance();
	FileService fileService = FileService.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		MemberVo member = session.getAttribute("member") == null ? new MemberVo() : (MemberVo) session.getAttribute("member");
		
		// MemberVo member = RequestToVoMapper.mapRequestToVo(req, MemberVo.class);
		
		// 회원 정보 가져오기 - 멤버 정보가 세션에 없는 경우 처리 해주기 
		member = memberService.memberDetail(member);
		
		int[] fileIds = {member.getFileNo()};
		System.out.println(fileIds);
		List<FileVo> fileList = fileService.getFileList(fileIds);
		
		req.setAttribute("fileList", fileList);
		req.setAttribute("member", member);
		
		ServletContext ctx = req.getServletContext();
		ctx.getRequestDispatcher("/WEB-INF/view/site/member/myPageUpdate.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] requiredParams = {"memberNo", "memberName", "memberAdd1", "memberTel", "memberEmail"};
		
		ParamResult paramResult = ParamResult.valid(req, requiredParams);// 필수인자 확인
		
		if (paramResult.getCode() == 1 && !paramResult.getMessage().equals("")) {
			// 에러 메시지를 요청 속성에 추가
			req.setAttribute("errorMessage", paramResult.getMessage());

			// 에러 페이지로 포워드
			req.getRequestDispatcher("/WEB-INF/view/error.jsp").forward(req, resp);
			return;
		}
		
		MemberVo updateMember = RequestToVoMapper.mapRequestToVo(req, MemberVo.class);
		
		System.out.println(updateMember);

		// 프로필 이미지 추가
		// 파일 삭제하는지 확인
		if (updateMember.getRemoveFileId() != 0) {
			int[] removeId = {updateMember.getRemoveFileId()};
			fileService.deleteFiles(removeId);
			updateMember.setFileNo(0);
		}
		
		// 새로운 파일 정보 추가
		FileVo file = FileUpload.fileWrite(req, "member");
		if (file != null) {
			List<FileVo> filsList = new ArrayList<FileVo>();
			filsList.add(file);
			fileService.addFiles(filsList);
			
			updateMember.setFileNo(file.getFileNo());
		}
		
		// 멤버 정보 수정
		int result = memberService.profileUpdate(updateMember);
		
		// 마이페이지로 이동
		resp.sendRedirect(req.getContextPath() + "/site/myPage.do");
	}
}
