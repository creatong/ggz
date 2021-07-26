package ggz.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;

public class PhoneCheckAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		String url="";
		boolean isRedirect=false;
		MemberDao memberDao = MemberDao.getInstance();
		
		String phone = request.getParameter("phone");
		int n = memberDao.checkPhone(phone);
		if(n==0 && phone.length()==13) {
			
			request.setAttribute("msg", "사용가능");
			
		}else {
			request.setAttribute("msg", "사용불가능");
		}
		
		request.setAttribute("phone", phone);
		url="./member/phoneCheck.jsp";
		return  new ActionForward(isRedirect, url);
	}

}