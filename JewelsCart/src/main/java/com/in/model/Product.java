package com.in.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="product_tbl")
public class Product {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int pid;
	@Column
	private String itemname;
	private String description;
	private String category;
	private String material;
	private int price;
	private int quantity;
	private String imageName;
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getMaterial() {
		return material;
	}
	public void setMaterial(String material) {
		this.material = material;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(int pid, String itemname,String description, String category, String material, int price,
			int quantity) {
		super();
		this.pid = pid;
		this.itemname = itemname;
//		this.imageName=imageName;
		this.description = description;
		this.category = category;
		this.material = material;
		this.price = price;
		this.quantity = quantity;
	}
	public Product(String itemname,String imageName,String description, String category, String material, int price,
			int quantity) {
		super();
	
		this.itemname = itemname;
		this.imageName=imageName;
		this.description = description;
		this.category = category;
		this.material = material;
		this.price = price;
		this.quantity = quantity;
	}
	public Product(String category, String description, String itemname, String material, int price,
			int quantity) {
		super();
		this.itemname = itemname;
		
		this.description = description;
		this.category = category;
		this.material = material;
		this.price = price;
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", itemname=" + itemname + ", description=" + description + ", category="
				+ category + ", material=" + material + ", price=" + price + ", quantity=" + quantity + "]";
	}
	
	
	
}
