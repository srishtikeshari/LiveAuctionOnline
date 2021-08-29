package model;

import java.sql.Time;

import java.util.Date;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

@MultipartConfig
public class Product {
	
	private int productMinPrice;
	private int categoryID;
	private String productStatus;
	private String closingPrice;
	private String winnerID;
	private String productcol;
	private int bidCount;
	private String startTime;
	private String stopTime;
	private Part productPicture;
	private String productDescription;
	private String productName;
	private int productID;
	private int sellerId;
	private String biddingDate;
	private String categoryName;
	
	public int getProductMinPrice() {
		return productMinPrice;
	}
	public void setProductMinPrice(int productMinPrice) {
		this.productMinPrice = productMinPrice;
	}
	public int getCategoryID() {
		return categoryID;
	}
	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}
	public String getProductStatus() {
		return productStatus;
	}
	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}
	public String getClosingPrice() {
		return closingPrice;
	}
	public void setClosingPrice(String closingPrice) {
		this.closingPrice = closingPrice;
	}
	public String getWinnerID() {
		return winnerID;
	}
	public void setWinnerID(String winnerID) {
		this.winnerID = winnerID;
	}
	public String getProductcol() {
		return productcol;
	}
	public void setProductcol(String productcol) {
		this.productcol = productcol;
	}
	public int getBidCount() {
		return bidCount;
	}
	public void setBidCount(int bidCount) {
		this.bidCount = bidCount;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getStopTime() {
		return stopTime;
	}
	public void setStopTime(String stopTime) {
		this.stopTime = stopTime;
	}
	public Part getProductPicture() {
		return productPicture;
	}
	public void setProductPicture(Part productPicture) {
		this.productPicture = productPicture;
	}
	public String getProductDescription() {
		return productDescription;
	}
	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getProductID() {
		return productID;
	}
	public void setProductID(int productID) {
		this.productID = productID;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public String getBiddingDate() {
		return biddingDate;
	}
	public void setBiddingDate(String biddingDate) {
		this.biddingDate = biddingDate;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	

}
