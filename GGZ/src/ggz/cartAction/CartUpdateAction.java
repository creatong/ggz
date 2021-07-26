package ggz.cartAction;

import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Cart;

public class CartUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		boolean isRedirect = false;
		String url ="";
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		int num = Integer.parseInt(request.getParameter("num"));
		String flag = request.getParameter("flag");
		
		
		num--;
		//System.out.println(num);
		
		HttpSession session = request.getSession();
		ArrayList<Cart> clist = (ArrayList<Cart>) session.getAttribute("cart");
		int quan = clist.get(num).getQuan();
		int total = clist.get(num).getTotalPrice();
		int price = clist.get(num).getM_price();
		if(flag.equals("1")) {
			total +=price ;
			quan++;
		}else {
			total -= price;
			quan--;
		}
		
		System.out.println(" total : "+total);
		clist.get(num).setQuan(quan);
		clist.get(num).setTotalPrice(total);
		
		session.setAttribute("cart", clist);
		request.setAttribute("pno", pno);
		url="/cartView.GGZ";
		
		return new ActionForward(isRedirect, url);//수량변경 할때마다 실행
	}

}
