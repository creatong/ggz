package ggz.mallAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.MallDao;
import ggz.vo.BoardList;
import ggz.vo.Mall;

public class MallInAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		boolean isRedirect =false;
		String url="";
		url="./mall/mallinsert.jsp";
		return new ActionForward(isRedirect,url);
		
	}

}
