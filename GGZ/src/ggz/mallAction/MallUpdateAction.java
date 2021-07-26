package ggz.mallAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ggz.dao.MallDao;
import ggz.vo.Mall;

public class MallUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String url="";
		boolean isRedirect = false;
		MallDao mDao = MallDao.getInstance();
		int pno = Integer.parseInt(request.getParameter("pno"));
		int idx = Integer.parseInt(request.getParameter("mallIdx"));
		
		String update = request.getParameter("update");
		String name = request.getParameter("name");
		
		String img_name = request.getParameter("img_name");
		String category = request.getParameter("category");
		String content = request.getParameter("content");
		
		if(update.equals("y")) {
			int price = Integer.parseInt(request.getParameter("price"));
			Mall mall = new Mall(idx, name, price, img_name, category,content);
			mDao.updateMall(mall);
			 mall = mDao.selectOne(idx);
			request.setAttribute("detailMall", mall);
			request.setAttribute("idx", idx);
			request.setAttribute("pno", pno);
			url = "./mallDetailSelect.GGZ?pno="+pno+"&mallIdx="+idx;
		}else {
			Mall mall = mDao.selectOne(idx);
			request.setAttribute("detailMall", mall);
			request.setAttribute("idx", idx);
			request.setAttribute("pno", pno);
			url = "./mallDetail/mallUpdate.jsp";
		}
		
		return new ActionForward(isRedirect, url);
	}

}
