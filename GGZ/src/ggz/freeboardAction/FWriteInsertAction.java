package ggz.freeboardAction;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.FreeboardDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Freeboard;

public class FWriteInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response)  {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		FreeboardDao freedao = FreeboardDao.getInstance();
		boolean isRedirect = false;
		String url ="";
		
		String path = request.getContextPath();
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		String insert = request.getParameter("insert");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String name = request.getParameter("name");
		
		if(insert!=null && insert.equals("1")) {
			int midx = Integer.parseInt(request.getParameter("midx"));
			Freeboard bean = new Freeboard();
			bean.setMidx(midx);
			bean.setSubject(subject);
			bean.setContent(content);
			bean.setName(name);
			freedao.insert(bean);
			isRedirect = true;
			url="freeboard.GGZ";
		}else {
			request.setAttribute("pno", pno);
			isRedirect = false;
			url="community/fWrite.jsp";
		}
		
		
		return new ActionForward(isRedirect, url);   
	}

}
