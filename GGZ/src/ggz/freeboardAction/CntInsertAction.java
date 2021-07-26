package ggz.freeboardAction;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ggz.dao.CommentDao;
import ggz.mallAction.Action;
import ggz.mallAction.ActionForward;
import ggz.vo.Comment;

public class CntInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		
		
			try {
				request.setCharacterEncoding("UTF-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			int idx = Integer.parseInt(request.getParameter("mref"));    //댓글 입력 완료 후 fDetailAction.GGZ로 url 변경할 때 필요한 파라미터 : 메인글 idx
			int mref = Integer.parseInt(request.getParameter("mref"));
			int pno = Integer.parseInt(request.getParameter("pno"));
			String name = request.getParameter("name");
			
			String content= request.getParameter("content");

			CommentDao cmtdao = CommentDao.getInstance();
			int cmtidx = Integer.parseInt(request.getParameter("cmtidx"));
					
			if(request.getParameter("func").equals("1")){   //댓글 추가
				int midx = Integer.parseInt(request.getParameter("midx"));
			//dao 객체 생성하고 insert
				Comment bean = new Comment();  
				bean.setMref(mref); 
				bean.setMidx(midx); 
				bean.setName(name); 
				bean.setContent(content);
			
				cmtdao.insert(bean);
			}else if(request.getParameter("func").equals("2")){  //댓글 수정
				cmtdao.update(content, cmtidx);  /* 댓글테이블 idx */
				
			}else if(request.getParameter("func").equals("3")){   //댓글 삭제
				cmtdao.delete(cmtidx);	
			}
			
			//FreeboardDao freedao = FreeboardDao.getInstance();
			int cmtcnt = cmtdao.getCmtCnt(mref);  //현재 글의 댓글 개수 구함.- 댓글추가와 삭제시에는 값이 변경됩니다.
			cmtdao.updateCmtCnt(cmtcnt, idx);     //위 실행결과로 업데이트
			
//		request.setAttribute("idx", idx);
//		request.setAttribute("pno", pno);
		//댓글 입력 완료 후 돌아가야할 url
		return new ActionForward(true,"fDetail.GGZ?idx="+idx+"&pno="+pno);

	}

}
