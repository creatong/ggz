package ggz.mallAction;

import java.io.UnsupportedEncodingException; 
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.FreeboardDao;
import ggz.dao.MallDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.BoardList;
import ggz.vo.Freeboard;
import ggz.vo.Mall;
import ggz.vo.Param;

public class MSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		MallDao mDao = MallDao.getInstance();
		
		int currentPage =1;
		String temp =request.getParameter("page");
		try {
			currentPage = Integer.parseInt(temp);
		}catch (NumberFormatException e){ }
		
		int pageSize = 10;
		//**검색
			String findText=request.getParameter("findT");
			
			BoardList blists ;
				Param p = new Param();
				
				p.setFindText(findText);
					
				int scnt = mDao.searchCount(p);
				blists = new BoardList(currentPage, scnt, pageSize);
					
				p.setEndNo(blists.getEndNo());
				p.setStartNo(blists.getStartNo());
				List<Mall> list = mDao.getList3(p);
					
				request.setAttribute("findT", findText);
				
				blists.setM_list(list);
				request.setAttribute("blists", blists);
		
		return new ActionForward(false, "./mall/list.jsp");   
	}

}
