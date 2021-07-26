package ggz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import ggz.mybatis.SqlSessionUtil;
import ggz.vo.Freeboard;
import ggz.vo.Param;

public class FreeboardDao {
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	
	private static FreeboardDao fdao = new FreeboardDao();
	
	private FreeboardDao() { }
	
	public static FreeboardDao getInstance() {
		return fdao;
	}

	public List<Freeboard> getList(int starNo,int endNo){
		List<Freeboard> list;
		SqlSession mapper = sqlFactory.openSession();
		
		//HashMap 객체에 2개 이상의 타입이 동일한 변수값을 저장할 수 있다.
		Map<String,Integer> map= new HashMap<>();
		map.put("startNo", starNo);   //key,value 한 쌍으로 저장
		map.put("endNo", endNo);
		
		list=mapper.selectList("freeboard.getList",map);   //id를 getList2로 바꿔서도 실행해보세요.
		mapper.close();
		return list;
	}
	
	public int getCount() {
		SqlSession mapper = sqlFactory.openSession();
		int cnt = mapper.selectOne("freeboard.getCount");  
		mapper.close();     //SqlSession 객체 메소드 selectList,selectOne,insert,update,delete 로 쿼리 실행
		return cnt;
	}
	
	public void insert(Freeboard bean) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("freeboard.insert",bean );  // 매퍼 xml 네임스페이스.id, id중복일 경우 네임스페이스로 식별
		mapper.commit();
		mapper.close();
	}
	
	public Freeboard getOne(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		Freeboard bean = mapper.selectOne("selectByIdx", idx);   //첫번째는 매퍼xml id값, 두번째 인자는 파라미터
		mapper.close();
		return bean;
	}
	
	public void updateCount(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("updateCount", idx);
		mapper.commit();
		mapper.close();
	}
	
	public void update(Freeboard bean) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("freeboard.update",bean );
		mapper.commit();
		mapper.close();	
	}
	
	public void delete(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.delete("freeboard.delete",idx );
		mapper.commit();
		mapper.close();
	}
	
	//selectSearch 검색    
	public List<Freeboard> getList3(Param p, int pageSize){
		List<Freeboard> list;
		
		SqlSession mapper = sqlFactory.openSession();
		
		list = mapper.selectList("freeboard.getList3",p);
		mapper.close();
		return list;
	}
	
	public int searchCount(Param p) { //Freeboard테이블 데이터 갯수
		SqlSession mapper = sqlFactory.openSession();
		System.out.println(p);
		int cnt = mapper.selectOne("freeboard.searchCount",p);
		return cnt;
	}
	
	public Freeboard getByIdx(int idx) {
		Freeboard vo = new Freeboard();
		SqlSession mapper = sqlFactory.openSession();
		vo = mapper.selectOne("selectByIdx", idx);
		mapper.close();
		return vo;
	}
	public List<Freeboard> getList3(int startNo,int endNo){
		List<Freeboard> list;
		
		SqlSession mapper = sqlFactory.openSession();
		
		Map<String,Integer> map = new HashMap<>();
		//1페이지 데이터 가져오기
		map.put("startNo", startNo);
		map.put("endNo", endNo);
		
		list = mapper.selectList("getList3",map);
		mapper.close();
		return list;
	}
	
}
