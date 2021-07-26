package ggz.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ggz.mybatis.SqlSessionUtil;
import ggz.vo.OrderList;

public class OrderListDao {
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	private static OrderListDao olDao = new OrderListDao();
	private OrderListDao() {}
	public static OrderListDao getInstance() {
		return olDao;
	}
	
	//insertMall 상품추가 (관리자만 가능)
	public void OrderListInsert(OrderList ol) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("OrderListInsert", ol);
		mapper.commit();
		mapper.close();
	}
	public List<OrderList> OrderListSelect(int m_idx){
		SqlSession mapper = sqlFactory.openSession();
		List<OrderList> list = mapper.selectList("OrderListSelect", m_idx);
		mapper.close();
		return list;
	}
	
	
}
