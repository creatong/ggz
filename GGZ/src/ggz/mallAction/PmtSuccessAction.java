package ggz.mallAction;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.MallDao;
import ggz.dao.MemberDao;
import ggz.dao.OrderListDao;
import ggz.vo.Cart;
import ggz.vo.Mall;
import ggz.vo.Member;
import ggz.vo.OrderList;

public class PmtSuccessAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		//기본 배송정보 - 이름, 전화번호, 주소, 현재포인트
		//member 최근 배송정보로 update  name, phone , addr , point(현재 point에서 price 빼기) session에서 값 가져옴
		//orderList 에 변경된 값들 update (idx,멤버이름,멤버idx, 상품이름, 가격, img_name , 구매날짜)
		//mall idx, price, img_name
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url=null;
		boolean isRedirect = false;
		MemberDao memDao = MemberDao.getInstance();
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("member");
		
		int pno= Integer.parseInt(request.getParameter("pno"));
		int mallIdx= Integer.parseInt(request.getParameter("mallIdx"));
		int sumAll = Integer.parseInt(request.getParameter("sumAll"));
		int oldPoint= member.getPoint();
		int memberIdx = member.getIdx();
		int newPoint= oldPoint - sumAll;
		System.out.println("oldp : "+oldPoint);
		System.out.println("sumAll : "+sumAll);
		System.out.println("newp : "+newPoint);
		if(newPoint<0) { //포인트가 부족(blceFail=y)하므로 상품 상세정보로 이동
			request.setAttribute("blceLow", "y");
			request.setAttribute("pno", pno);
			request.setAttribute("mallIdx", mallIdx);
			url="./cart/mCart.jsp";
		}else { //포인트가 안부족함
		//1. member update
		String name=member.getName();
		String phone=request.getParameter("m_phone");
		String addr = request.getParameter("m_addr");
		member=new Member();
		member.setIdx(memberIdx);
		member.setPhone(phone);
		member.setAddr(addr);
		member.setPoint(newPoint);
		memDao.pmtUpdate(member);
		session.setAttribute("member", member);
		
		//orderList insert : idx,멤버이름,멤버idx, 상품이름, 가격, img_name , 구매날짜 , 배송메모
		ArrayList<Cart> cList = (ArrayList<Cart>) session.getAttribute("cart");
		String memo = request.getParameter("memo");
		OrderListDao oDao = OrderListDao.getInstance();
		OrderList ol;
		for (int i = 0; i < cList.size(); i++) {
			ol = new OrderList(name, memberIdx, cList.get(i).getM_name(),
					cList.get(i).getM_price(), cList.get(i).getImg_name(),memo,cList.get(i).getMallIdx());
			oDao.OrderListInsert(ol);
		}
		request.setAttribute("memo", memo);
		request.setAttribute("finCart", cList);
		request.setAttribute("sumAll", sumAll);
		session.removeAttribute("cart");
		url="/mallDetail/pmtSuccess.jsp";
		}
		
		
		
		return new ActionForward(isRedirect, url);
	}

}
