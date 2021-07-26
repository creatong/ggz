package ggz.mallAction;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ggz.dao.MallDao;
import ggz.vo.Mall;

public class MallDetailSelectAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String url=null;
		boolean isRedirect = false;
		MallDao mDao = MallDao.getInstance();
		
		if(request.getParameter("pno")!="") {
		int pno = Integer.parseInt(request.getParameter("pno"));
		request.setAttribute("pno", pno);
		}
		int idx = Integer.parseInt(request.getParameter("mallIdx"));
		request.setAttribute("mallIdx", idx);
		Mall mall = mDao.selectOne(idx);
		request.setAttribute("detailMall", mall);
		url="/mallDetail/mallDetail.jsp";
		return new ActionForward(isRedirect, url);
	}

}
