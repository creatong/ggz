package ggz.memberAction;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Member;

public class FindIdAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url="";
		boolean isRedirect=false;
		
		MemberDao memberDao= MemberDao.getInstance();
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String view=request.getParameter("view");
			
			if(view!=null&&view.equals("y")) {
				url="./member/findId.jsp";
			}else {
				Member member = memberDao.findId(name, phone);
				if(member!=null) {
					//값 찾음
					request.setAttribute("findId", member);
					request.setAttribute("view", "n");
					url="./member/findId.jsp"; 
				}else {
					//찾는값 없음
					//url="./member/findPassword.jsp"; 
				}
				
		}
	
		return  new ActionForward(isRedirect, url);
	
		
		
	}
}
