package ggz.mallAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import ggz.dao.MallDao;
import ggz.vo.Mall;

public class MallDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("delete들어옴");
		String url="";
		boolean isRedirect = false;
		String delete = request.getParameter("delete");
		int idx = Integer.parseInt(request.getParameter("mallIdx"));
		MallDao mDao = MallDao.getInstance();
		System.out.println(delete+"  "+idx);
		if(delete.equals("y")) {
			System.out.println(delete+"  "+idx);
			mDao.deleteMall(idx);
			isRedirect = true;
			url="./listSelect.GGZ";
		}
		return new ActionForward(isRedirect, url);
	}

}
