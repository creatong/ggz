package ggz.mallAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.reflection.SystemMetaObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


import ggz.dao.MallDao;
import ggz.vo.Mall;


public class MallInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		MallDao mdao = MallDao.getInstance();  
		String path = "C://mall_img";
		int size=375*375*10;
		try {
			MultipartRequest multi_request = new MultipartRequest(request,path,size,"UTF-8",
												new DefaultFileRenamePolicy());
			
		
			String name = multi_request.getParameter("name");
			int price = Integer.parseInt(multi_request.getParameter("price"));
			String img_name = multi_request.getFilesystemName("img_name");
			String category = multi_request.getParameter("category");
			String content = multi_request.getParameter("content");
		
			Mall mall = new Mall(0, name, price, img_name, category, content);
			//System.out.println(mall);
			mdao.insertMall(mall); 
			//System.out.println("insert 완료!");
		}catch(Exception e){   e.printStackTrace();	}
		
		return new ActionForward(true, "./listSelect.GGZ");
	}
}



