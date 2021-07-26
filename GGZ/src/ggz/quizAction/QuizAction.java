package ggz.quizAction;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;


public class QuizAction implements Action {     //cTest.GZZ 첫화면 

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	
		return new ActionForward(false, "./quiz/quiz.jsp");
	}
}
