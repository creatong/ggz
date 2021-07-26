package ggz.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ggz.mybatis.SqlSessionUtil;
import ggz.vo.Freeboard;
import ggz.vo.Mall;
import ggz.vo.Param;

public class MallDao {
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	private static MallDao mallDao = new MallDao();
	private MallDao() {}
	public static MallDao getInstance() {
		return mallDao;
	}
	
	//selectAll mall 모두보기
	public List<Mall> selectAll(int starNo,int endNo){
		List<Mall> list;
		SqlSession mapper = sqlFactory.openSession();
		
		//HashMap 객체에 2개 이상의 타입이 동일한 변수값을 저장할 수 있다.
		HashMap<String,Integer> map= new HashMap<>();

		map.put("startNo", starNo);   //key,value 한 쌍으로 저장
		map.put("endNo", endNo);
		
		list=mapper.selectList("mall.selectAll",map);   //id를 getList2로 바꿔서도 실행해보세요.
		mapper.close();
		return list;
	}
	//selectCategory 카테고리 별로 select
	public List<Mall> selectCategory(int starNo,int endNo, String category){
		List<Mall> list;
		SqlSession mapper = sqlFactory.openSession();
		System.out.println(category);
		//HashMap 객체에 2개 이상의 타입이 동일한 변수값을 저장할 수 있다.
		HashMap<String,Object> map= new HashMap<>();
		map.put("category", category);
		map.put("startNo", starNo);   //key,value 한 쌍으로 저장
		map.put("endNo", endNo);
		
		list=mapper.selectList("mall.selectCategory",map);   //id를 getList2로 바꿔서도 실행해보세요.
		mapper.close();
		return list;
	}
	// 모두보기 게시글 카운트
	public int getCount() {
		SqlSession mapper = sqlFactory.openSession();
		int cnt = mapper.selectOne("mall.getCount");  
		mapper.close();     //SqlSession 객체 메소드 selectList,selectOne,insert,update,delete 로 쿼리 실행
		return cnt;
	}
	//카테고리 게시글 카운트
	public int getCategoryCount(String category) {
        SqlSession mapper = sqlFactory.openSession();
        int cnt = mapper.selectOne("getCategoryCount",category);
        mapper.close(); 
        return cnt;
    }
	//selectSearch 검색    
	public List<Mall> getList3(Param p){
		List<Mall> list;
		
		SqlSession mapper = sqlFactory.openSession();
		
		list = mapper.selectList("mall.getList3",p);
		mapper.close();
		return list;
	}
	//Freeboard테이블 검색된 데이터 갯수
	public int searchCount(Param p) { 
		SqlSession mapper = sqlFactory.openSession();
		int cnt = mapper.selectOne("mall.searchCount",p);
		return cnt;
	}
	//selectOne 상품 상세보기
	public Mall selectOne(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		Mall mall=mapper.selectOne("mall.selectDetail", idx);
		mapper.close();
		return mall;
	}
	
	//insertMall 상품추가 (관리자만 가능)
	public void insertMall(Mall mall) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("insertMall", mall);
		mapper.commit();
		mapper.close();
	}
	
	//deleteMall 상품삭제 (관리자만 가능)
	public void deleteMall(int idx) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.delete("deleteMall", idx);
		mapper.commit();
		mapper.close();
	}
	
	//updateMall 상품수정
	public void updateMall(Mall mall) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("updateMall", mall);
		mapper.commit();
		mapper.close();
	}
	
	//updatePoint 멤버 테이블에 포인트 사용 적용
	
}
