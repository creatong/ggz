package ggz.vo;

import java.util.Date;

public class Member {
	private int idx;
	private String name;
	private String email;
	private String password;
	private String addr;
	private Date birthday;
	private String phone;
	private Date creatday;
	private int point;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}
	
	


	public Member(int idx, String name, String email, String password, String addr, Date birthday, String phone,
			Date creatday, int point) {
		super();
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.password = password;
		this.addr = addr;
		this.birthday = birthday;
		this.phone = phone;
		this.creatday = creatday;
		this.point = point;
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getCreatday() {
		return creatday;
	}
	public void setCreatday(Date creatday) {
		this.creatday = creatday;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}




	@Override
	public String toString() {
		return "Member [idx=" + idx + ", name=" + name + ", email=" + email + ", password=" + password + ", addr="
				+ addr + ", birthday=" + birthday + ", phone=" + phone + ", creatday=" + creatday + ", point=" + point
				+ "]";
	}
	
	
}
