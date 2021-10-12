package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.common.Action;
import controller.common.ActionForward;

public class ActionImgForm implements Action {			//업로드 버튼 클릭시 업로드 페이지로 이동

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(true);
		forward.setPath("imgform.jsp");
		return forward;
	}
	
}
