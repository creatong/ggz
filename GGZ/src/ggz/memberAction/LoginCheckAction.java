package ggz.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;

public class LoginCheckAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String url="";
		boolean isRedirect=false;
		MemberDao memberDao = MemberDao.getInstance();
		
		String email = request.getParameter("email");
		int n = memberDao.checkEmail(email);
		if(n==0) {
			
			request.setAttribute("msg", "사용가능");
			
		}else {
			request.setAttribute("msg", "사용불가능");
		}
		
		request.setAttribute("email", email);
		url="./member/idCheck.jsp";
		return  new ActionForward(isRedirect, url);
	}

}
