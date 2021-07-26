package ggz.freeboardAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.FreeboardDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;

public class FDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		int idx = Integer.parseInt(request.getParameter("idx"));	
			
		FreeboardDao freedao = FreeboardDao.getInstance();
		freedao.delete(idx);
		
		return new ActionForward(true,"freeboard.GGZ");
	}

}
