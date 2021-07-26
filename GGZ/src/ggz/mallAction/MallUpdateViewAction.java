package ggz.mallAction;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import ggz.dao.MallDao;
import ggz.vo.Mall;

public class MallUpdateViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String url="";
		boolean isRedirect = false;
		MallDao mDao = MallDao.getInstance();
			int pno = Integer.parseInt(request.getParameter("pno"));
			int idx = Integer.parseInt(request.getParameter("mallIdx"));
				
				Mall mall = mDao.selectOne(idx);
				request.setAttribute("detailMall", mall);
				request.setAttribute("idx", idx);
				request.setAttribute("pno", pno);
				url = "/mallDetail/mallUpdate.jsp";
		
		return new ActionForward(isRedirect, url);
	}

}
