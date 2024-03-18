package com.in.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Payment_tbl")
public class Payment {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int payId;
	@Column
	
	private String email;
	private String item;
	private int price;
	private int qty;
	private String address;
	private int pincode;
	private long cardNumber;
	private String cardHolderName;
	private int cvv;
	private Date expiryDate;
	private String imageName;
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public int getPayId() {
		return payId;
	}
	public void setPayId(int payId) {
		this.payId = payId;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getPincode() {
		return pincode;
	}
	public void setPincode(int pincode) {
		this.pincode = pincode;
	}
	public long getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(long cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardHolderName() {
		return cardHolderName;
	}
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	public Date getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}
	public Payment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Payment(int payId, String email, String item, int price, int qty, String address, int pincode,
			long cardNumber, String cardHolderName, int cvv, Date expiryDate) {
		super();
		this.payId = payId;
	
		this.email = email;
		this.item = item;
		this.price = price;
		this.qty = qty;
		this.address = address;
		this.pincode = pincode;
		this.cardNumber = cardNumber;
		this.cardHolderName = cardHolderName;
		this.cvv = cvv;
		this.expiryDate = expiryDate;
	}
	public Payment( String email, String item, int price, int qty, String address, int pincode,
			long cardNumber, String cardHolderName, int cvv, Date expiryDate,String imageName) {
		super();
		
		
		this.email = email;
		this.item = item;
		this.price = price;
		this.qty = qty;
		this.address = address;
		this.pincode = pincode;
		this.cardNumber = cardNumber;
		this.cardHolderName = cardHolderName;
		this.cvv = cvv;
		this.expiryDate = expiryDate;
		this.imageName= imageName;
	}
	@Override
	public String toString() {
		return "Payment [payId=" + payId + ", name="  + ", email=" + email + ", item=" + item + ", price=" + price
				+ ", qty=" + qty + ", address=" + address + ", pincode=" + pincode + ", cardNumber=" + cardNumber
				+ ", cardHolderName=" + cardHolderName + ", cvv=" + cvv + ", expiryDate=" + expiryDate + "]";
	}
	
	
	
	
	
}
