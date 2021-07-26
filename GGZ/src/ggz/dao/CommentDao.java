package ggz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ggz.vo.Comment;

import ggz.dao.CommentDao;
import ggz.mybatis.SqlSessionUtil;

public class CommentDao {
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	private static CommentDao cdao = new CommentDao();
	private CommentDao() {}
	public static CommentDao getInstance() {
		return cdao;
	}
	
	public List<Comment> getCmtList(int mref){
		SqlSession mapper = sqlFactory.openSession();
		List<Comment> list = mapper.selectList("getCmtList", mref);
		mapper.close();
		return list;		
	}
	
	public void insert(Comment bean) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("comment.insert", bean);
		mapper.commit();
		mapper.close();
	}
	
	public void update(String content,int idx ) {
		SqlSession mapper = sqlFactory.openSession();
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("content",content);  map.put("idx",idx);
		mapper.update("comment.update", map); 
		mapper.commit();
		mapper.close();
	}
	
	public void delete(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.delete("comment.delete",idx);
		mapper.commit();
		mapper.close();
	}
	
	public int getCmtCnt(int mref) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.selectOne("getCmtCnt", mref);
		mapper.close();
		return n;
	}
	//실행 확인 후 FreeboardDao 로 이동합니다.
	public void updateCmtCnt(int cmtcnt,int idx) {
		Map<String,Integer> map = new HashMap<String, Integer>();
		map.put("cmtcnt",cmtcnt);
		map.put("idx",idx);
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("comment.updateCmtCnt",map);
		mapper.commit();
		mapper.close();
	}
}
