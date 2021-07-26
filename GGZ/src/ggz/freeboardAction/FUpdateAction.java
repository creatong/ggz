package ggz.freeboardAction;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;

import ggz.dao.FreeboardDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Freeboard;

public class FUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String func = request.getParameter("func");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int pno = Integer.parseInt(request.getParameter("pno"));
		
		FreeboardDao freedao = FreeboardDao.getInstance();
		boolean isRedirect = false;
		String url ="";
		
		//func=view 이면 update.jsp 페이지 화면 보여주기. 
		//fDetail.jsp에서 수정눌렀을 때
		if(func!=null && func.equals("view")){  //fUpdate.jsp 화면 표시(기존값 출력) 
			 request.setAttribute("pno", pno);
			 request.setAttribute("bean", freedao.getOne(idx));
			 url="community/fUpdate.jsp";

			 
		}else{  //func가 null 일때 실행하게 됩니다.
			//그렇지 않으면  , dao 메소드 실행 
			//fUpdate.jsp에서 저장눌렀을때
			//수정을 완료하면 FDetailAction로 요청 이동합니다. 
			String subject = request.getParameter("subject");
			String content = request.getParameter("content");
			Freeboard bean = new Freeboard();  
			bean.setIdx(idx); 
			bean.setSubject(subject); 
			bean.setContent(content);
			freedao.update(bean);
			isRedirect = true;
			url="fDetail.GGZ?idx="+idx+"&pno="+pno;
			
		}
		return new ActionForward(isRedirect, url);

	}
}
