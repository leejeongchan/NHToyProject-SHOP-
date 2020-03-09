package shop.model;

public class OrderVO {
	/*
	 * `orderId` varchar(50) not null,
	    `userId` varchar(20) not null,
	    `orderRec` varchar(20) not null,
	    `userAddress` varchar(100) not null,
	    `orderPhon` int,
	    `amount` int not null,
	 */
	private String orderId;
	private String userId;
	private String orderRec;
	private String userAddress;
	private String orderPhon;
	private int amount;
	private int orderState;
	
	
	
	public int getOrderState() {
		return orderState;
	}
	public void setOrderState(int orderState) {
		this.orderState = orderState;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOrderRec() {
		return orderRec;
	}
	public void setOrderRec(String orderRec) {
		this.orderRec = orderRec;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public String getOrderPhon() {
		return orderPhon;
	}
	public void setOrderPhon(String orderPhon) {
		this.orderPhon = orderPhon;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
}
