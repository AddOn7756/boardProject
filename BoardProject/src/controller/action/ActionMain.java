package controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.common.Action;
import controller.common.ActionForward;
import model.users.UsersDAO;

public class ActionMain implements Action {

	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		ActionForward forward = new ActionForward();
		HttpSession session=request.getSession();
		
		UsersDAO userDAO = new UsersDAO();
		
		session.setAttribute("datas", userDAO.getDBList());
		
		forward.setRedirect(false);
		forward.setPath("main.jsp");
		
		return forward;
	}

}
