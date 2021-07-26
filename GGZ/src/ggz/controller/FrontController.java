package ggz.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.cartAction.CartDeleteAction;
import ggz.cartAction.CartInsertAction;
import ggz.cartAction.CartUpdateAction;
import ggz.cartAction.CartViewAction;
import ggz.freeboardAction.CntInsertAction;
import ggz.freeboardAction.FDeleteAction;
import ggz.freeboardAction.FDetailAction;
import ggz.freeboardAction.FListAction;
import ggz.freeboardAction.FSearchAction;
import ggz.freeboardAction.FUpdateAction;
import ggz.freeboardAction.FWriteInsertAction;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.mallAction.CategorySelectAction;
import ggz.mallAction.MSearchAction;
import ggz.mallAction.MallDeleteAction;
import ggz.mallAction.MallDetailSelectAction;
import ggz.mallAction.MallInAction;
import ggz.mallAction.MallInsertAction;
import ggz.mallAction.MallListAction;
import ggz.mallAction.MallUpdateAction;
import ggz.mallAction.MallUpdateViewAction;
import ggz.mallAction.PayMentSelectAction;
import ggz.mallAction.PmtSuccessAction;
import ggz.memberAction.FindIdAction;
import ggz.memberAction.FindPasswordAction;
import ggz.memberAction.HomeAction;
import ggz.memberAction.JoinInsertAction;
import ggz.memberAction.LoginCheckAction;
import ggz.memberAction.LoginSelectOneAction;
import ggz.memberAction.LogoutAction;
import ggz.memberAction.MemberUpdateAction;
import ggz.memberAction.PhoneCheckAction;
import ggz.quizAction.CTestGradeAction;
import ggz.quizAction.CTestNextAction;
import ggz.quizAction.CTestPreAction;
import ggz.quizAction.CTestSelectAction;
import ggz.quizAction.MTestGradeAction;
import ggz.quizAction.MTestNextAction;
import ggz.quizAction.MTestPreAction;
import ggz.quizAction.MTestSelectAction;
import ggz.quizAction.QuizAction;

@WebServlet("*.GGZ")
public class FrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		boolean isRedirect = true;
		String url = "";
		Action action = null;
		ActionForward forward= null;
		String spath = request.getServletPath();
		System.out.println(spath);
		if(spath.equals("/listSelect.GGZ")) {
			System.out.println("프론트컨트롤");
			action = new MallListAction();
			forward = action.execute(request, response);
		}
		//mall controller
		else if(spath.equals("/mallDetailSelect.GGZ")) { // 선택상품 상세정보 selectone
			action = new MallDetailSelectAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mallDelete.GGZ")) { //관리자 전용 상품 삭제 delete
			System.out.println("프론트컨트롤러에옴");
			action = new MallDeleteAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/mallUpdate.GGZ")) { //관리자 전용 상품 수정 update
			action = new MallUpdateAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/mallUpdateView.GGZ")) {
			action = new MallUpdateViewAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/payMent.GGZ")) { //결제화면 이동 기본 배송정보를 위해 session정보 가져오기
			action = new PayMentSelectAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/pmtSuccess.GGZ")) { //결제성공 화면 
			action = new PmtSuccessAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/categorySelect.GGZ")) {
			action = new CategorySelectAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mallInsertAction.GGZ")) {
			action = new MallInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mallInsert.GGZ")) {
			action = new MallInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mallIn.GGZ")) {
			action = new MallInAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mSearch.GGZ")) {
			action = new MSearchAction();
			forward = action.execute(request, response);
		}
		//cart controller
		else if(spath.equals("/cartDelete.GGZ")) { 
			action = new CartDeleteAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/cartInsert.GGZ")) { 
			action = new CartInsertAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/cartUpdate.GGZ")) { 
			action = new CartUpdateAction();
			forward=action.execute(request, response);
		}else if(spath.equals("/cartView.GGZ")) { 
			action = new CartViewAction();
			forward=action.execute(request, response);
		}
		//member controller
		else if (spath.equals("/join.GGZ")) {
			action = new JoinInsertAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/home.GGZ")) {
			action = new HomeAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/update.GGZ")) {
			action = new MemberUpdateAction();
			forward = action.execute(request, response);
		}else if (spath.equals("/login.GGZ")) {
			action = new LoginSelectOneAction();
			forward = action.execute(request, response);
		}else if (spath.equals("/logout.GGZ")) {
			action = new LogoutAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/idCheck.GGZ")) {
			action = new LoginCheckAction();
			forward = action.execute(request, response);		
		}else if(spath.equals("/findId.GGZ")){
			action = new FindIdAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/findPassword.GGZ")){
			action = new FindPasswordAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/phoneCheck.GGZ")){
			action = new PhoneCheckAction();
			forward = action.execute(request, response);
		}

		//freeboard controller
		else if(spath.equals("/freeboard.GGZ")) {
			action = new FListAction();
			forward = action.execute(request, response);
			System.out.println("체크용");
			
		}else if(spath.equals("/fWrite.GGZ")) {
			action = new FWriteInsertAction();
			forward=action.execute(request, response);
			
		}else if(spath.equals("/fDetail.GGZ")) {
			action = new FDetailAction();
			forward=action.execute(request, response);
			
		}else if(spath.equals("/fSearch.GGZ")) {
			action = new FSearchAction();
			forward=action.execute(request, response);
			
		}else if(spath.equals("/fUpdate.GGZ")) {
			action = new FUpdateAction();
			forward=action.execute(request, response);
			
		}else if(spath.equals("/fDelete.GGZ")) {
			action = new FDeleteAction();
			forward=action.execute(request, response);
			
		}else if(spath.equals("/comment.GGZ")) {
			action = new CntInsertAction();
			forward=action.execute(request, response);
		}
		
		//quiz controller
		else if(spath.equals("/quiz.GGZ")) {
			action = new QuizAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mTest.GGZ")) {
			action = new MTestSelectAction();
			forward = action.execute(request, response);
		}
		else if(spath.equals("/mTestnext.GGZ")) {
			action = new MTestNextAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mTestpre.GGZ")) {
			action = new MTestPreAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/mTestGrade.GGZ")) {
			action = new MTestGradeAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cTest.GGZ")) {
			action = new CTestSelectAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cTestnext.GGZ")) {
			action = new CTestNextAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cTestpre.GGZ")) {
			action = new CTestPreAction();
			forward = action.execute(request, response);
		}else if(spath.equals("/cTestGrade.GGZ")) {
			action = new CTestGradeAction();
			forward = action.execute(request, response);
		}
		
		
		
		
		
		
		if(forward!=null) {
		isRedirect = forward.isRedirect();
		url = forward.getUrl();
		}
		if(isRedirect) {
			response.sendRedirect(url);
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(url);
			rd.forward(request, response);
		}
				
	}
}
