package com.human.VO;

public class PageVO {
	private int startNo;
	private int endNo;
	private int perPageNum = 10;
	private Integer page;
	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private String search_word;

	public String getSearch_word() {
		return search_word;
	}

	public void setSearch_word(String search_word) {
		this.search_word = search_word;
	}


	public void calcPage() {
		startNo = (page - 1) * perPageNum + 1;
		int tempEndPage = (int) (Math.ceil(page / (double) perPageNum) * perPageNum);

		startPage = (tempEndPage - perPageNum) + 1;
		if (tempEndPage * perPageNum > totalCount) {
			endPage = (int) (Math.ceil(totalCount / (double) perPageNum));
			if (endPage != page) {
				endNo = startNo + perPageNum - 1;
			} else {
				if (totalCount % 10 == 0) {
					endNo = startNo + perPageNum - 1;
				} else {
					endNo = startNo + totalCount % 10 - 1;
				}
			}
		} else {
			endPage = tempEndPage;
			endNo = startNo + perPageNum - 1;
		}
		prev = startPage != 1;
		next = endPage * perPageNum < totalCount;
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

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
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

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

}
