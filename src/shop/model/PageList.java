package shop.model;

import java.util.List;


public class PageList {

	private List<GoodsVO> list;
	private int currentPage; 	// 현재페이지
	private int pageSize;		// 1페이지당 갯수 정해짐
	
	private int totalBoardCount;		// 전체  글 개수 -- DB에서 알아온다.
	
	private int totalPage;		// 전체페이지수
	private int startNo;		// 글 시작번호
	private int endNo;			// 글 마지막번호 -- DB 사용 서비스에서 구현
	
	private int startPage; // 페이지 시작번호 
	private int endPage; 	// 페이지 마지막 번호
	private int blockSize;	// 페이지의 개수
	
	public PageList( int currentPage, int pageSize,int blockSize,
			int totalBoardCount) {
		super();
		
		this.currentPage = currentPage;	
		this.pageSize = pageSize;	
		this.blockSize = blockSize;
		this.totalBoardCount = totalBoardCount;		
		
		calculateTotalPage(); // 총 페이지 개수
		calcPaging(); //페이지 검사 및 시작과 끝 검사
	}
	
	// 총 페이지 개수 구해주기
	public void calculateTotalPage() {
		
		if(totalBoardCount == 0) {
			totalPage =0;
		} else {
			totalPage = totalBoardCount / pageSize; // mysql은 인덱스 1부터 시작
			if(totalBoardCount % pageSize > 0)
				totalPage++;
		}
	}
	public void calcPaging() {	
		// [1] 페이지 게시글/출력 페이지개수 유효성 검사 이후 잘못될 경우 설정
		if(pageSize<1) pageSize=5;	// 1페이지에서  출력되는 게시글 개수
		if(blockSize<1)  blockSize=10;	// 게시판 하단에 출력할 페이지 개수 (1~10)
		if(currentPage <1 || currentPage>totalPage) currentPage=1;
		System.out.println("[1] 페이지 게시글/출력 페이지개수 세팅 완료");
		
		// [2] 각 페이시의 게시글 시작과 끝번호 정해주기
		startNo = (currentPage -1)*pageSize +1; // 시작은 1 부터 시작해서 10개씩
		endNo = startNo + pageSize -1 ;
		
		// [3] 마지막 게시판번호~~
		if(endNo > totalBoardCount) endNo = totalBoardCount; // 마지막 게시판번호가 총개수보다  크면..
		
		// [4] 해당 블록(10개) 에서 페이지의 시작과 끝 정해주기
		startPage = ( (currentPage-1)/blockSize)*blockSize +1;
		endPage = startPage + blockSize -1;
		System.out.println("[2] 페이지 게시글/출력 페이지개수 세팅 완료"+startPage+endPage);

		// [5] 총 페이지 개수가 끝번호 페이지보다 작다면 끝번호를 총페이지 수로 맞춰준다.
		if(endPage > totalPage) endPage=totalPage;
	}
	public void setList(List<GoodsVO> list) {
		this.list = list;
	}
	public List<GoodsVO> getList() {
		return list;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public int getTotalBoardCount() {
		return totalBoardCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	
	
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public boolean isEmpty() {
		return totalBoardCount == 0;
	}
}
