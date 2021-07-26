package ggz.quizAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MemberDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Member;



public class MTestGradeAction implements Action  {     //mTest.GZZ 첫화면 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(); 

		
		int grade = Integer.parseInt(request.getParameter("grade")); //현재 점수 저장 
		
		int point = Integer.parseInt(request.getParameter("point")); //포인트 저장 

		MemberDao memberDao = MemberDao.getInstance();				
		Member member = (Member) session.getAttribute("member");
		
		int prePoint = member.getPoint();

		member.setPoint(prePoint+point);

		memberDao.updatePoint(member);

		request.setAttribute("grade", grade);
		request.setAttribute("point", point);

		return new ActionForward(false, "./quiz/mTestGrade.jsp");
	}
}
