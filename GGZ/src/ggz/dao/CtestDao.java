package ggz.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ggz.mybatis.SqlSessionUtil;
import ggz.vo.Ctest;


public class CtestDao {
	//Dao 는 싱글턴(singleton) : 객체를 1개만 생성하고 공유(static)한다.
	private static CtestDao dao = new CtestDao();
	private CtestDao() {}
	
	public static CtestDao getInstance() {
		return dao;
	}
	
	//마이바티스 
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	
	
	public Ctest selectCIdx(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		Ctest cquiz = mapper.selectOne("selectCIdx",idx);
		mapper.close();
		return cquiz;
	}
	
	public int cntCIdx() {
		SqlSession mapper = sqlFactory.openSession();
		int cnt = mapper.selectOne("cntCIdx");
		mapper.close();
		return cnt;
	}

}
