package ggz.cartAction;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import ggz.dao.MallDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Cart;
import ggz.vo.Mall;

public class CartInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		boolean isRedirect = false;
		MallDao mDao = MallDao.getInstance();
		HttpSession session = request.getSession();
		String path = request.getContextPath();
		System.out.println("getservlet  "+path);
		int mallIdx = Integer.parseInt(request.getParameter("mallIdx"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		String goPmt=request.getParameter("goPmt");
		Mall mall = mDao.selectOne(mallIdx);
		ArrayList<Cart> cList;
		Cart cart = null;
		int i = 0;
		boolean flag = false;
		if (session.getAttribute("cart") == null) {// 장바구니가 비어있음
			cList = new ArrayList<Cart>();
			cart = new Cart(1, mallIdx, 1, mall.getPrice(), mall.getName(), mall.getPrice(), mall.getImg_name());
			cList.add(cart);
		} else {// 장바구니 담기 누름
			cList = (ArrayList<Cart>) session.getAttribute("cart");
			// 중복상품 체크
			for (i = 0; i < cList.size(); i++) {
				if (mallIdx == cList.get(i).getMallIdx()) {
					flag = true;
					break;
				}
			}
			if (flag) {// 있으면 수량과 합계금액 변경
				cList.get(i).setQuan(cList.get(i).getQuan() + 1);
				cList.get(i).setTotalPrice(cList.get(i).getTotalPrice() + cList.get(i).getM_price());
			} else {// 없으면 장바구니 내역추가
				cart = new Cart(cList.size() + 1, mallIdx, 1, mall.getPrice(), mall.getName(), mall.getPrice(),
						mall.getImg_name());
				cList.add(cart);
			}
		}
		session.setAttribute("cart", cList);
		request.setAttribute("pno", pno);
		request.setAttribute("mallIdx", mallIdx);
		request.setAttribute("path", path);
		if(goPmt!=null && goPmt.equals("y")) {
			url="./payMent.GGZ";
		}else {
			url = "./cartView.GGZ";
		}
		return new ActionForward(isRedirect, url);// 장바구니 누를때 한번 실행
	}
}