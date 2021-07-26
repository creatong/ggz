package ggz.freeboardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.FreeboardDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.BoardList;

public class FListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//싱글턴패턴 : 생성자를 private로 선언하여 다른클래스에서 해당 클래스의 인스턴스를 new로 생성하지 못하게 하고, 
		//getInstance()라는 함수를 통해서 인스턴스를 갖도록 한다.
		FreeboardDao fdao = FreeboardDao.getInstance();	//싱글턴패턴, 하나의 인스턴스만 가지고 공유해서 쓴다
		int totalcount = fdao.getCount();
		
		int currentPage = 1;  //기본값
		
		String temp = request.getParameter("pno");  //currentPage 결정하는 파라미터값.
		if(temp != null)  //url이 FListAction.jsp 이면 파라미터 null
		currentPage = Integer.parseInt(temp);
		
		HttpSession session = request.getSession();
		BoardList blists = new BoardList(currentPage,totalcount,20);   //세번째 20은 페이지크기
		//실행 순간 필요한 모든 값이 초기화 ->BoardList 객체에 저장.
		
		String check = "이하니";
		//**startNo ~ endNo 까지 글 리스트 선택한 것을 BoardList list 멤버로 설정한다.
		blists.setF_list(fdao.getList(blists.getStartNo(), blists.getEndNo()));
		session.setAttribute("loginUser", check);	//"member", member로 바꾸기
 		request.setAttribute("blists", blists);
		return new ActionForward(false,"/community/freeboard.jsp");	//test 애트리뷰트 데이터가 jsp로 바인딩
	}


}
//뷰 이동 , 내용이 바뀌면 --> isRedirect==false, url="폴더명/_____.jsp"