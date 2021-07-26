package ggz.vo;

import java.util.Date;

//freeboard 테이블 컬럼과 매핍되는 프로퍼티 설정

public class Freeboard {
		private int idx;			//번호
		private int midx;			//session에 있는 member_j에idx값을 midx에 저장
		private String name;		//이름
		private String subject;		//제목
		private String content;		//내용
		private int readCount;		//조회수
		private Date wdate;			//작성날짜
		private int commentCount;	//댓글수
		
		public Freeboard() {
			// TODO Auto-generated constructor stub
		}
		
		public int getIdx() {
			return idx;
		}
		public void setIdx(int idx) {
			this.idx = idx;
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
		
		public String getSubject() {
			return subject;
		}
		public void setSubject(String subject) {
			this.subject = subject;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public int getReadCount() {
			return readCount;
		}
		public void setReadCount(int readCount) {
			this.readCount = readCount;
		}
		
		public Date getWdate() {
			return wdate;
		}
		
		public void setWdate(Date wdate) {
			this.wdate = wdate;
		}
		
		public int getCommentCount() {
			return commentCount;
		}
		public void setCommentCount(int commentCount) {
			this.commentCount = commentCount;
		}
		
		@Override
		public String toString() {
			return "Freeboard [idx=" + idx + ", midx=" + midx + ", name=" + name + ", subject=" + subject + ", content="
					+ content + "]";
		}
		
		
}

