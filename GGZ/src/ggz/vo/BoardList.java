package ggz.vo;

import java.util.List;

//페이징(1페이지에 보여줄 목록과 페이지 이동부분설정)
//에 필요한 변수들을 멤버로 함.
public class BoardList {
	private int currentPage;   //현재 페이지
	private int totalCount;		//전체 글의 갯수
	private int pageSize;	//1페이지 목록의 글 갯수
	
	private int totalPage;
	private int startNo; 	//현재 페이지 상품 목록 시작번호
	private int endNo; 		//현재 페이지 상품 목록 마지막번호
	private int startPage;	//현재 페이지 페이지목록 시작번호
	private int endPage;	//현재 페이지 페이지목록 마지막번호
	
	private List<Mall> m_list;    //페이징으로 계산된 starNO~endNo 글 리스트를 참조
	private List<Freeboard> f_list;    //페이징으로 계산된 starNO~endNo 글 리스트를 참조
	
	public BoardList(int currentPage,int totalCount,int pageSize) {
		//멤버변수 2개 값 설정
		this.totalCount = totalCount;
		this.pageSize = pageSize;
		
		//나머지 멤버변수 계산하기
		totalPage = (totalCount - 1) / pageSize + 1;
		this.currentPage 
			= currentPage > totalPage ? totalPage:currentPage;
		this.currentPage 
			= currentPage < 1 ? 1:currentPage;

		 startNo = (this.currentPage - 1) * pageSize +1 ;    
		endNo = startNo + pageSize -1 ;   
		startPage = (this.currentPage - 1) / 10 * 10 + 1; 
		endPage = startPage + 9;
		endPage = endPage > totalPage ? totalPage : endPage; //마지막 페이지용
	}

	


	public List<Mall> getM_list() {
		return m_list;
	}

	public void setM_list(List<Mall> m_list) {
		this.m_list = m_list;
	}

	public List<Freeboard> getF_list() {
		return f_list;
	}

	public void setF_list(List<Freeboard> f_list) {
		this.f_list = f_list;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartNo() {
		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}




	@Override
	public String toString() {
		return "BoardList [currentPage=" + currentPage + ", totalCount=" + totalCount + ", pageSize=" + pageSize
				+ ", totalPage=" + totalPage + ", startNo=" + startNo + ", endNo=" + endNo + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", m_list=" + m_list + ", f_list=" + f_list + "]";
	}


	
	
}
