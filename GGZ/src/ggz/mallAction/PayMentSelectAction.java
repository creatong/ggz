package ggz.mallAction;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MallDao;
import ggz.vo.Cart;
import ggz.vo.Mall;

public class PayMentSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//기본 배송정보 - 이름, 전화번호, 주소, 현재포인트
		//Member member = session.getAttribute("loginUser");
		String url=null;
		boolean isRedirect = false;
		int pno=0;
		int idx=0;
		if(request.getParameter("pno")!=null) {
		pno = Integer.parseInt(request.getParameter("pno"));
		idx = Integer.parseInt(request.getParameter("mallIdx"));
		request.setAttribute("pno", pno);
		request.setAttribute("mallIdx", idx);
		}
		HttpSession session = request.getSession();
		ArrayList<Cart> cList = (ArrayList<Cart>) session.getAttribute("cart");
		int sumAll=0;
		for (int i = 0; i < cList.size(); i++) {
			sumAll+=cList.get(i).getTotalPrice();
		}
		request.setAttribute("sumAll", sumAll);
		
		url = "/mallDetail/payMent.jsp";
		return new ActionForward(isRedirect, url);
	}

}
