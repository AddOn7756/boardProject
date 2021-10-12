package controller.action;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.ActionForward;
import model.users.UsersDAO;
import model.users.UsersVO;

public class ActionImgDelete {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = new ActionForward();

		UsersDAO userDAO = new UsersDAO();
		UsersVO userVO = new UsersVO();

		String filePath = request.getSession().getServletContext().getRealPath("images"); //서버 이미지 경로
		userVO.setUserNum(Integer.parseInt(request.getParameter("userNum")));
		userVO.setIconId(request.getParameter("filename"));

		if(userDAO.deleteImg(userVO)) {
			//파일 삭제
			filePath += "/"+userVO.getIconId();
			File file = new File(filePath);	//파일 생성
			if(file.exists()) {				//파일이 있을시 삭제 
				file.delete();
			}
			forward.setRedirect(true);
			forward.setPath("main.do");
		}
		else {
			System.out.println("파일 삭제 실패");
			forward.setRedirect(true);
			forward.setPath("main.do");
		}
		return forward;
	}


}
