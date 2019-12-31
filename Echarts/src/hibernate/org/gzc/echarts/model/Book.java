package org.gzc.echarts.model;
// Generated 2019-12-31 10:19:46 by Hibernate Tools 5.3.1.Final

/**
 * Book generated by hbm2java
 */
public class Book implements java.io.Serializable {

	private String isbn;
	private String id;
	private String name;
	private Double price;
	private Integer remainnumber;

	public Book() {
	}

	public Book(String isbn) {
		this.isbn = isbn;
	}

	public Book(String isbn, String id, String name, Double price, Integer remainnumber) {
		this.isbn = isbn;
		this.id = id;
		this.name = name;
		this.price = price;
		this.remainnumber = remainnumber;
	}

	public String getIsbn() {
		return this.isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getRemainnumber() {
		return this.remainnumber;
	}

	public void setRemainnumber(Integer remainnumber) {
		this.remainnumber = remainnumber;
	}

}
