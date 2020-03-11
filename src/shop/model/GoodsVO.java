package shop.model;

public class GoodsVO {
	private int gdsNum;
	private String gdsName;
	private int cateCode;
	private int gdsPrice;
	private int gdsStock;
	private String gdsDes;
	private String gdsImg;
	private String gdsReg;
	private int gdsHit;
	private int gdsReplyCnt;
	
	//추가
	private String gdsStartDate;
	private String gdsEndDate;
	private int gdsEndFlag;
	
	
	public String getGdsStartDate() {
		return gdsStartDate;
	}
	public void setGdsStartDate(String gdsStartDate) {
		this.gdsStartDate = gdsStartDate;
	}
	public String getGdsEndDate() {
		return gdsEndDate;
	}
	public void setGdsEndDate(String gdsEndDate) {
		this.gdsEndDate = gdsEndDate;
	}
	public int getGdsEndFlag() {
		return gdsEndFlag;
	}
	public void setGdsEndFlag(int gdsEndFlag) {
		this.gdsEndFlag = gdsEndFlag;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public String getGdsName() {
		return gdsName;
	}
	public void setGdsName(String gdsName) {
		this.gdsName = gdsName;
	}
	public int getCateCode() {
		return cateCode;
	}
	public void setCateCode(int cateCode) {
		this.cateCode = cateCode;
	}
	public int getGdsPrice() {
		return gdsPrice;
	}
	public void setGdsPrice(int gdsPrice) {
		this.gdsPrice = gdsPrice;
	}
	public int getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	public String getGdsDes() {
		return gdsDes;
	}
	public void setGdsDes(String gdsDes) {
		this.gdsDes = gdsDes;
	}
	public String getGdsImg() {
		return gdsImg;
	}
	public void setGdsImg(String gdsImg) {
		this.gdsImg = gdsImg;
	}
	public String getGdsReg() {
		return gdsReg;
	}
	public void setGdsReg(String gdsReg) {
		this.gdsReg = gdsReg;
	}
	public int getGdsHit() {
		return gdsHit;
	}
	public void setGdsHit(int gdsHit) {
		this.gdsHit = gdsHit;
	}
	public int getGdsReplyCnt() {
		return gdsReplyCnt;
	}
	public void setGdsReplyCnt(int gdsReplyCnt) {
		this.gdsReplyCnt = gdsReplyCnt;
	} 
	
	
}
