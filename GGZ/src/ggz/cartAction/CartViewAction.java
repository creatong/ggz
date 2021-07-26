package ggz.cartAction;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ggz.dao.MallDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Cart;
import ggz.vo.Mall;

public class CartViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String url = "";
		boolean isRedirect = false;
		if(request.getParameter("pno")!=null) {
			int pno = Integer.parseInt(request.getParameter("pno"));
			request.setAttribute("pno", pno);
		}
		url="./cart/mCart.jsp";

		return new ActionForward(isRedirect, url);
	}

}
