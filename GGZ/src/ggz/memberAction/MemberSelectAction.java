package ggz.memberAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;

public class MemberSelectAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		String url="";
		boolean isRedirect=false;
		
		return  new ActionForward(isRedirect, url);
	}

}
