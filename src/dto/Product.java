package dto;

import java.io.Serializable;

public class Product implements Serializable{
	
	private static final long serialVersionUID = -4274700572038677000L;
	
	private String productId;
	private String pname;
	private Integer unitPrice;
	private String description;
	private String ability;
	private String filename;
	private int quantity;
		
	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getAbility() {
		return ability;
	}

	public void setAbility(String ability) {
		this.ability = ability;
	}	

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product() {
		super();
	}

	public Product(String productId, String pname, Integer unitPrice) {		
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
	}	
	
	
	
}
