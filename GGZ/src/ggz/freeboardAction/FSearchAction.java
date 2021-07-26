package ggz.freeboardAction;

import java.io.UnsupportedEncodingException; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.FreeboardDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.BoardList;
import ggz.vo.Freeboard;
import ggz.vo.Param;

public class FSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		FreeboardDao freedao = FreeboardDao.getInstance();
		
		int currentPage =1;
		String temp =request.getParameter("page");
		try {
			currentPage = Integer.parseInt(temp);
		}catch (NumberFormatException e){ }
		
		int pageSize = 10;
		//**검색
			String findText=request.getParameter("findT");
			String field = request.getParameter("field");
			BoardList blists ;
				Param p = new Param();
				p.setField(field);
				p.setFindText(findText);
					
				int scnt = freedao.searchCount(p);
				blists = new BoardList(currentPage, scnt, pageSize);
					
				p.setEndNo(blists.getEndNo());
				p.setStartNo(blists.getStartNo());
				List<Freeboard> list = freedao.getList3(p, pageSize);
					
				request.setAttribute("findT", findText);
				request.setAttribute("field", field);
				blists.setF_list(list);
				request.setAttribute("blists", blists);
		
		return new ActionForward(false, "/community/freeboard.jsp");   
	}

}
