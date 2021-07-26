package ggz.quizAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.CtestDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Ctest;


public class CTestSelectAction implements Action {     //cTest.GZZ 첫화면 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		CtestDao dao = CtestDao.getInstance();
		int idx=1; //문제 인덱스 번호
		int grade=0; //현재 점수 저장 변수
		int cnt = dao.cntCIdx();

		Ctest cquiz = dao.selectCIdx(idx);
		request.setAttribute("cquiz", cquiz);
		request.setAttribute("grade", grade); 
		request.setAttribute("cnt",cnt);

		return new ActionForward(false, "./quiz/cTest.jsp");
	}
}
