package shop.model;

public class GoodsStockVO {
	private int gdsNum;
	private int gdsStock;
	public GoodsStockVO(int gdsNum,int gdsStock) {
		this.gdsNum = gdsNum;
		this.gdsStock = gdsStock;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}
	public int getGdsStock() {
		return gdsStock;
	}
	public void setGdsStock(int gdsStock) {
		this.gdsStock = gdsStock;
	}
	
	
}
