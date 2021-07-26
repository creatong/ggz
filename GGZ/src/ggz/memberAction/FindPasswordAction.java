package ggz.memberAction;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Member;

public class FindPasswordAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String url="";
		boolean isRedirect=false;
		
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String view = request.getParameter("view");
		
		if(view!=null && view.equals("y")) {
			url="/member/findPassword.jsp?view=y";
		}else {
			Member find = new Member();
			find.setEmail(email);
			find.setName(name);
			find.setPhone(phone);
			
			MemberDao member = MemberDao.getInstance();
			find = member.findPassword(find);
			request.setAttribute("findPassword", find);

		if(find!=null) {	
			request.setAttribute("findPassword", find);
			request.setAttribute("view","n");
			url = "./member/findPassword.jsp";
		}else {
		 	url = "./findPassword.GGZ";
		 	isRedirect = true;
		}
			
	}	
		
		
		
		
		
		
		return  new ActionForward(isRedirect, url);
	}

}
