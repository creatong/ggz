package ggz.mallAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import ggz.dao.MallDao;
import ggz.vo.BoardList;
import ggz.vo.Mall;


public class CategorySelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		boolean isRedirect =false;
		String url="";
		MallDao mdao = MallDao.getInstance();

		
		int currentPage = 1;  //기본값
		
		String temp = request.getParameter("pno");  //currentPage 결정하는 파라미터값.
		if(temp != null)  //url이 listAction.jsp 이면 파라미터 null
			currentPage = Integer.parseInt(temp);
		String category = request.getParameter("category");
		int totalcount = mdao.getCategoryCount(category);
		
		BoardList blists = new BoardList(currentPage,totalcount,6);//(현재페이지, 전체페이지, 한 화면에 띄울 게시글 개수)
		//**startNo ~ endNo 까지 글 리스트 선택한 것을 BoardList list 멤버로 설정한다.
		//왜와이? 페이징 하는 와중에 계속 쓰이는 객체는 blists 이기 때문 

		blists.setM_list(mdao.selectCategory(blists.getStartNo(), blists.getEndNo(), category));
		
		request.setAttribute("btn", request.getParameter("btn"));
		request.setAttribute("pno", currentPage);
		request.setAttribute("blists", blists);
		request.setAttribute("category", category);
		url="/mall/list.jsp";
		return new ActionForward(isRedirect,url);
		
	}

}


