package ggz.vo;

import java.util.Date;

public class Mall {
	private int idx;
	private String name;
	private int price;
	private int count;
	private Date wdate;
	private String img_name;
	private String category;
	private String content;
	
	public Mall() {}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Mall [idx=" + idx + ", name=" + name + ", price=" + price + ", count=" + count + ", wdate=" + wdate
				+ ", img_name=" + img_name + ", category=" + category + ", content=" + content + "]";
	}

	public Mall(int idx, String name, int price, String img_name, String category, String content) {
		super();
		this.idx = idx;
		this.name = name;
		this.price = price;
		this.img_name = img_name;
		this.category = category;
		this.content = content;
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

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
