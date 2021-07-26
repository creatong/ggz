package ggz.memberAction;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MemberDao;
import ggz.dao.OrderListDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Member;
import ggz.vo.OrderList;

public class MemberUpdateAction implements Action {

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
		HttpSession session = request.getSession(); 
		
		OrderListDao oDao = OrderListDao.getInstance();
		MemberDao memberDao = MemberDao.getInstance();
		String update = request.getParameter("update");		
		Member member = (Member) session.getAttribute("member");
		
		if(update!=null && update.equals("y")) {
			String password=request.getParameter("password");
			String addr=request.getParameter("addr");
			String phone=request.getParameter("phone");

			member.setPassword(password);
			member.setAddr(addr);
			member.setPhone(phone);
			memberDao.update(member);
			
			session.setAttribute("member",member);
			request.setAttribute("up", "y");
			url = "./update.GGZ";
		}else {
		 	url = "./member/myPage.jsp";
		}
		int m_idx=member.getIdx();
		request.setAttribute("orderList", oDao.OrderListSelect(m_idx));
		return  new ActionForward(isRedirect, url);
	}

}
