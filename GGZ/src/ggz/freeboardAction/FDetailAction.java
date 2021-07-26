package ggz.freeboardAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ggz.dao.CommentDao;
import ggz.dao.FreeboardDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Comment;
import ggz.vo.Freeboard;

public class FDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		FreeboardDao freedao = FreeboardDao.getInstance();
		
		CommentDao cmtdao = CommentDao.getInstance();	

		//1개의 pno 파라미터가 없으면? 1)기본값을 준다.  2) 오류페이지로 이동한다.(O)
		int idx = Integer.parseInt(request.getParameter("idx"));
		//글 상세보기 -> 글목록으로 돌아가기(보던 페이지)
		int pno = Integer.parseInt(request.getParameter("pno"));

		//*comment 에서 필드 mref로 검색한 결과의 리스트가 필요합니다. 검색값은 idx
		List<Comment> cmtlist = cmtdao.getCmtList(idx);
		
		//freeboard에서 필드 readcount 업데이트 (1증가)
		if(request.getParameter("nocnt")==null)   //댓글 입력 후 detailAction.jsp 실행할 때는 조회수 증가 안함.
			freedao.updateCount(idx);
		
		Freeboard bean = freedao.getOne(idx);
		request.setAttribute("pno", pno);
		request.setAttribute("bean", bean);  //상세보기페이지로 detail.jsp
		//*댓글리스트 바인딩 필요
		request.setAttribute("cmtlist", cmtlist);
		return new ActionForward(false,"community/fDetail.jsp");
	}

}
