package ggz.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;



public class HomeAction implements Action{
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		String url;
		boolean isRedirect=false;
		HttpSession session = request.getSession();
	
		 
	
		if (session.getAttribute("member")==null) {
			isRedirect=true;      
			System.out.println("아이디 ,비밀번호를 입력하세요");
			url="./index.jsp";
		}else {
			request.setAttribute("login", request.getParameter("login"));
			System.out.println("로그인완료");
			url="./index.jsp";
		}
		return  new ActionForward(isRedirect, url);
	}

}
