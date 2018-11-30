package board.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class BoardPaging {
	private int pageBlock;//[이전][1][2][3][다음] - 블록 디자인
	private int totalA;//총글수
	//private int countList - 한페이지에 출력될 '게시물' 수
	private int pageSize;//1페이지당 5개씩 -출력될 페이지 수
	private int currentPage;//현재 페이지 번호
	private StringBuffer pagingHTML;
	
	
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageBlock() {
		return pageBlock;
	}

	public void setPageBlock(int pageBlock) {
		this.pageBlock = pageBlock;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalA() {
		return totalA;
	}

	public void setTotalA(int totalA) {
		this.totalA = totalA;
	}

	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}

	public void setPagingHTML(StringBuffer pagingHTML) {
		this.pagingHTML = pagingHTML;
	}

	
	
	//페이지 제작탭------------------------------------------------------------------------
	public void makePagingHTML() { 
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("[<a id='paging' href='boardList.do?pg="+(startPage-1)+"'>이전</a>]");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<a id='currentPaging' href='boardList.do?pg="+i+"'>"+i+"</a>]");
			else
				pagingHTML.append("[<a id='paging' href='boardList.do?pg="+i+"'>"+i+"</a>]");
		}
		
		if(endPage < totalP)
			pagingHTML.append("[<a id='paging' href='boardList.do?pg="+(endPage+1)+"'>다음</a>]");
	}

	
	
	//검색 페이지 탭------------------------------------------------------------------------
	public void makeSearchPagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;
		
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("[<span id='paging' onclick='boardSearch("+(startPage-1)+")'>이전</span>]");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("[<span id='currentPaging' onclick='boardSearch("+i+")'>"+i+"</span>]");
			else
				pagingHTML.append("[<span id='paging' onclick='boardSearch("+i+")'>"+i+"</span>]");
		}
		
		if(endPage < totalP)
			pagingHTML.append("[<span id='paging' onclick='boardSearch("+(endPage+1)+")'>다음</span>]");
	}
}