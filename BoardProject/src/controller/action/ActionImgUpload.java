package controller.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.common.Action;
import controller.common.ActionForward;
import model.users.UsersDAO;
import model.users.UsersVO;

public class ActionImgUpload implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = new ActionForward();

		UsersDAO userDAO = new UsersDAO();
		UsersVO userVO = new UsersVO();

		//서버 경로
		String filePath = request.getSession().getServletContext().getRealPath("images"); 
		String encoding = "UTF-8";


		// 최대 16Mbyte 고정
		int maxSize = 16 * 1024 * 1024; 
		MultipartRequest multi;


		try {

			multi = new MultipartRequest(request, filePath, maxSize, encoding,	// 파일 생성	
					new DefaultFileRenamePolicy()); // 동일이름 자동 리네임		
			userVO.setIconId((String)multi.getFilesystemName("filename")); // 생성된 파일의 이름 가져오기
			userVO.setUserNum(Integer.parseInt(multi.getParameter("usernum")));
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		UsersVO uvo = userDAO.getDBData(userVO);
		System.out.println(uvo);
		// reupload 시 파일삭제
		if (uvo.getIconId() != null) {
			//파일 삭제
			filePath += "/"+uvo.getIconId();
			File file = new File(filePath);	//파일 생성
			if(file.exists()) {				//파일이 있을시 삭제 
				file.delete();
			}
		}
		
		if (userDAO.uploadImg(userVO)) {
			System.out.println("업로드 성공");
			forward.setRedirect(false);
			forward.setPath("main.do");
		}
		else {
			System.out.println("업로드 실패");
			//업로드 실패시 파일 삭제
			filePath += "/" + userVO.getIconId();	//경로
			File file = new File(filePath);			//파일 생성
			if(file.exists()) {						//파일이 있을시 때
				file.delete();
			}
			forward.setRedirect(false);
			forward.setPath("form.do");
		}
		return forward;
	}
}
