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
	public void makeSearchPagingHTML(String searchOption, String keyword) {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
		int startPage = (currentPage-1)/pageBlock*pageBlock+1;
		int endPage = startPage+pageBlock-1;		
		if(endPage > totalP) endPage = totalP;
		
		if(startPage > pageBlock)
			pagingHTML.append("<ul class='pagination'><li class='page-item'><a id='paging' class='page-link' tabindex='-1' href='#' onclick='boardSearch("+(startPage-1)+","+searchOption+","+keyword+")'>이전</a></li></ul>");
		
		for(int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append("<ul class='pagination'><li class='page-item active'><a id='currentPaging' class='page-link' href='#' onclick='boardSearch("+i+","+searchOption+","+keyword+")'>"+i+"<span class='sr-only'></span></a></li></ul>");
			else
				pagingHTML.append("<ul class='pagination'><li class='page-item'><a id='paging' class='page-link' href='#' onclick='boardSearch("+i+","+searchOption+","+keyword+")'>"+i+"</a></li></ul>");
		}
		
		if(endPage < totalP)
			pagingHTML.append("<ul class='pagination'><li class='page-item'><a class='page-link' href='#' id='paging' onclick='boardSearch("+(endPage+1)+","+searchOption+","+keyword+")'>다음</a></li></ul>");
	}
}