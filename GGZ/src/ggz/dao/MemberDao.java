package ggz.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ggz.dao.MemberDao;
import ggz.mybatis.SqlSessionUtil;
import ggz.vo.Member;

public class MemberDao {
	
	SqlSessionFactory sqlFactory = SqlSessionUtil.getSessionFactory();
	
	private static MemberDao memberDao = new MemberDao();
	
	private MemberDao() {
	}
	
	public static MemberDao getInstance() {
		return memberDao;
	}


	public List<Member> selectList(){  
		SqlSession mapper = sqlFactory.openSession();

		List<Member> list = null;
		list = mapper.selectList("member.selectAll");   
		
		mapper.close();  
		return list;
	}
	
	public Member login(String email, String password) {
		Member member = null;
		SqlSession mapper = sqlFactory.openSession();
		
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("email", email);
		data.put("password", password);
		member = mapper.selectOne("login",data);
		mapper.close();
		return member;
	}
	
	public void insert(Member member) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.insert("addMember",member);
		mapper.commit();
		mapper.close();
		
	}
	public int checkEmail(String email) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.selectOne("checkEmail",email);
		
		mapper.close();
		return n;
	}
	public void update(Member member) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("updateMember",member);
		mapper.commit();
		mapper.close();
	}
	public void pmtUpdate(Member member) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("pmtUpdate",member);
		mapper.commit();
		mapper.close();
	}
	public Member findId(String name, String phone) {
		Member member = null;
		SqlSession mapper = sqlFactory.openSession();
		
		HashMap<String, String> data = new HashMap<String, String>();
		data.put("name", name);
		data.put("phone", phone);
		member = mapper.selectOne("member.findId",data);
		mapper.close();
		return member;
	}
	public Member findPassword(Member member) {
		SqlSession mapper = sqlFactory.openSession();
		Member mem = mapper.selectOne("member.findPassword",member);
		mapper.close();
		
		return mem;
	}
	public int checkPhone(String phone) {
		SqlSession mapper = sqlFactory.openSession();
		int n = mapper.selectOne("checkPhone",phone);
		
		mapper.close();
		return n;
	}
	public void updatePoint(Member member) {
		SqlSession mapper = sqlFactory.openSession();
		mapper.update("member.updatePoint",member);
		mapper.commit();
		mapper.close();
	}
	
}
