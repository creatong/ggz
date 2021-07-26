package ggz.vo;

import java.util.Date;

public class Comment {
	private int idx;
	private int mref;
	private int midx;
	private String name;
	private String content;
	private Date wdate;
	
	public Comment() {
		// TODO Auto-generated constructor stub
	}
	

	public Comment(int idx, int mref, int midx, String name, String content, Date wdate) {
		super();
		this.idx = idx;
		this.mref = mref;
		this.midx = midx;
		this.name = name;
		this.content = content;
		this.wdate = wdate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getMref() {
		return mref;
	}

	public void setMref(int mref) {
		this.mref = mref;
	}

	public int getMidx() {
		return midx;
	}

	public void setMidx(int midx) {
		this.midx = midx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}


	@Override
	public String toString() {
		return "Comment [idx=" + idx + ", mref=" + mref + ", midx=" + midx + ", name=" + name + ", content=" + content
				+ ", wdate=" + wdate + "]";
	}

	
	
	
	
}
