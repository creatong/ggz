package ggz.dao;


import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ggz.mybatis.SqlSessionUtil;
import ggz.vo.Mtest;


public class MtestDao {
	//Dao 는 싱글턴(singleton) : 객체를 1개만 생성하고 공유(static)한다.
	private static MtestDao dao = new MtestDao();
	private MtestDao() {}
	
	public static MtestDao getInstance() {
		return dao;
	}
	
	//마이바티스 
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	
	
	public Mtest selectMIdx(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		Mtest mquiz = mapper.selectOne("selectMIdx",idx);
		mapper.close();
		return mquiz;
	}
	
	public int cntMIdx() {
		SqlSession mapper = sqlFactory.openSession();
		int cnt = mapper.selectOne("cntMIdx");
		mapper.close();
		return cnt;
	}

}
