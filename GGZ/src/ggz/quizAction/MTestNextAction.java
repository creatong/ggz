package ggz.quizAction;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MtestDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Mtest;


public class MTestNextAction implements Action {     //mTest.GZZ 다음 문제 불러오는 화면 
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MtestDao dao = MtestDao.getInstance();
		
		int cnt = dao.cntMIdx();
		
		int idx= Integer.parseInt(request.getParameter("idx"));
		String choice =  request.getParameter("choice");
		int grade = Integer.parseInt(request.getParameter("grade")); //현재 점수 저장 
		String answer =  request.getParameter("answer");
				
		String[] choices = (String[]) session.getAttribute("choices");
		String[] answers = (String[]) session.getAttribute("answers");

		if(choices == null)
			choices = new String[cnt];
		if(answers == null)
			answers = new String[cnt];
		choices[idx-1]=choice;
		answers[idx-1]=answer;

		Mtest mquiz = dao.selectMIdx(idx);
		
		session.setAttribute("choices", choices);
		session.setAttribute("answers", answers);

		request.setAttribute("ch", choices[idx-1]);
		request.setAttribute("mquiz", mquiz);
		request.setAttribute("grade", grade);
		request.setAttribute("an", answers[idx-1]);
		request.setAttribute("cnt",cnt);

		return new ActionForward(false, "/quiz/mTest.jsp");
		
	}
}
