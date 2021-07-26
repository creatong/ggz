package ggz.quizAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.MtestDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Mtest;


public class MTestSelectAction implements Action {     //mTest.GZZ 첫화면 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MtestDao dao = MtestDao.getInstance();
		int idx=1; //문제 인덱스 번호
		int grade=0; //현재 점수 저장 변수
		int cnt = dao.cntMIdx();

		Mtest mquiz = dao.selectMIdx(idx);
		request.setAttribute("mquiz", mquiz);
		request.setAttribute("grade", grade); 
		request.setAttribute("cnt",cnt);

		return new ActionForward(false, "./quiz/mTest.jsp");
	}
}
