package ggz.memberAction;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Member;

public class JoinInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String url="";
		boolean isRedirect = false;
		
		MemberDao memberDao = MemberDao.getInstance();
		String insert = request.getParameter("insert");	
		
		String name = request.getParameter("name");
		DateFormat dt = new SimpleDateFormat("yyyy-MM-dd");
		String email=request.getParameter("email");
		String password=request.getParameter("pwd");
		String addr=request.getParameter("addr");
		Date birthday = null;
		
		String phone=request.getParameter("phone");
		if(insert!=null&&insert.equals("y")) {
			try {
				birthday = dt.parse(request.getParameter("birthday"));
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}		
			Member member = new Member();
			member.setName(name);
			member.setEmail(email);
			member.setPassword(password);
			member.setAddr(addr);
			member.setBirthday(birthday);
			member.setPhone(phone);
			memberDao.insert(member);
			isRedirect = true;
			url = "./home.GGZ";
		}else {
			List<Member> member  = memberDao.selectList();
			request.setAttribute("Member", member);
			url = "./member/join.jsp";
		}
		
		return new ActionForward(isRedirect, url);
	}

}
