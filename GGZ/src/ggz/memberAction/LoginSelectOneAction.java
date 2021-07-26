package ggz.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Member;

public class LoginSelectOneAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String url="";
		boolean isRedirect=false;
		
		MemberDao memberDao= MemberDao.getInstance();
		HttpSession session = request.getSession();
		
		
		String email = request.getParameter("userid");
		String password = request.getParameter("pwd");
		if(email==null){ 
			request.setAttribute("login", request.getParameter("login"));
			request.setAttribute("re", request.getParameter("re"));
			url = "./member/login.jsp";
			
		}else { 
			Member member = memberDao.login(email, password);
			if(member!=null) {
				session.setAttribute("member", member);
				url="./home.GGZ?login=y";
				isRedirect=true;
				
			}else {
				url="./login.GGZ?login=n";
				isRedirect=true;
			}
		}
		
	return  new ActionForward(isRedirect, url);
 }
}
