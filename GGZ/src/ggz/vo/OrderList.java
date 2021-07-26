package ggz.vo;

import java.util.Date;

public class OrderList {
	private int idx;
	private String m_name;
	private int m_idx;
	private String mall_name;
	private int price;
	private String img_name;
	private Date wdate;
	private String memo;
	private int mall_idx;
	
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	
	
	public OrderList(String m_name, int m_idx, String mall_name, int price, String img_name, String memo,
			int mall_idx) {
		super();
		this.m_name = m_name;
		this.m_idx = m_idx;
		this.mall_name = mall_name;
		this.price = price;
		this.img_name = img_name;
		this.memo = memo;
		this.mall_idx = mall_idx;
	}

	public OrderList () {}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public int getM_idx() {
		return m_idx;
	}

	public void setM_idx(int m_idx) {
		this.m_idx = m_idx;
	}

	public String getMall_name() {
		return mall_name;
	}

	public void setMall_name(String mall_name) {
		this.mall_name = mall_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	@Override
	public String toString() {
		return "OrderList [idx=" + idx + ", m_name=" + m_name + ", m_idx=" + m_idx + ", mall_name=" + mall_name
				+ ", price=" + price + ", img_name=" + img_name + ", wdate=" + wdate + ", memo=" + memo + ", mall_idx="
				+ mall_idx + "]";
	}

	public Date getWdate() {
		return wdate;
	}

	public int getMall_idx() {
		return mall_idx;
	}

	public void setMall_idx(int mall_idx) {
		this.mall_idx = mall_idx;
	}




	
	
	
}
