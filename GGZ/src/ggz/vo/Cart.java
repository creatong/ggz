package ggz.vo;

public class Cart {
	private int num; //장바구니에 담긴 번호
	private int mallIdx; // 상품번호
	private int quan;
	private int totalPrice;
	private String m_name;
	private int m_price;
	private String img_name;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getMallIdx() {
		return mallIdx;
	}
	public void setMallIdx(int mallIdx) {
		this.mallIdx = mallIdx;
	}
	public int getQuan() {
		return quan;
	}
	public void setQuan(int quan) {
		this.quan = quan;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public int getM_price() {
		return m_price;
	}
	public void setM_price(int m_price) {
		this.m_price = m_price;
	}
	public String getImg_name() {
		return img_name;
	}
	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	@Override
	public String toString() {
		return "Cart [num=" + num + ", mallIdx=" + mallIdx + ", quan=" + quan + ", totalPrice=" + totalPrice
				+ ", m_name=" + m_name + ", m_price=" + m_price + ", img_name=" + img_name + "]";
	}
	
	public Cart(int num, int mallIdx, int quan, int totalPrice, String m_name, int m_price, String img_name) {
		super();
		this.num = num;
		this.mallIdx = mallIdx;
		this.quan = quan;
		this.totalPrice = totalPrice;
		this.m_name = m_name;
		this.m_price = m_price;
		this.img_name = img_name;
	}
	
	
	}
