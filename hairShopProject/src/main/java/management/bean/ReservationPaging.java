package management.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class ReservationPaging {
	private int currentPage;	
	private int pageBlock;
	private int pageSize;
	private int totalA;
	private StringBuffer pagingHTML;
	
	public void makePagingHTML() {
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA+pageSize-1) / pageSize;
		int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if(endPage>totalP)endPage = totalP;

		if(startPage>pageBlock)
			pagingHTML.append("[<a id='paging' href='reservationManagement.do?pg="+(startPage-1)+"'>PREV</a>]");
		
		for (int i=startPage; i<=endPage; i++) {
			if(i==currentPage)
				pagingHTML.append(" <a id='currentPaging' href='reservationManagement.do?pg="+i+"'><font size='3' style='color: red;'>"+i+"</font></a>");
			else
				pagingHTML.append(" <a id='paging' href='reservationManagement.do?pg="+i+"'><font size='3'>"+i+"</font></a>");
		}
		
		if(endPage < totalP)
			pagingHTML.append("[<a id='paging' href='reservationManagement.do?pg="+(endPage+1)+"'> 다음<font size='2'>▶</font></a>]");
	}
	
	public void makeSearchPagingHTML(){
		pagingHTML = new StringBuffer();
		
		int totalP = (totalA + pageSize - 1) / pageSize;
		int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;
		if (endPage>totalP)endPage = totalP;

		if (startPage > pageBlock)
			pagingHTML.append("[<span id='paging' onclick='reservationSearch("+(startPage-1)+")'>PREV</span>]");

		for (int i=startPage; i<=endPage; i++) {
			if (i == currentPage) {
				pagingHTML.append(" <span id='currentPaging' onclick='reservationSearch("+i+")'><font size='3' style='color: red;'>"+i+"</font></span>");
			} else {
				pagingHTML.append(" <span id='paging' onclick='reservationSearch("+i+")'><font size='3'>"+i+"</font></span>");
			}
		}

		if (endPage < totalP)
			pagingHTML.append("[<span id='paging' onclick='reservationSearch("+(endPage+1)+")'>NEXT</span>]");
	}
	
	public StringBuffer getPagingHTML() {
		return pagingHTML;
	}
}
