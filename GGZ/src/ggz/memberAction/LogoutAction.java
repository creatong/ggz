package ggz.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;

public class LogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		String url;
		boolean isRedirect=false;
			
		
			session.invalidate();
			isRedirect=false;      
			request.setAttribute("logout", "y");
			url="./index.jsp";
	
		return  new ActionForward(isRedirect, url);
	}

}
