package com.alpha;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Booking {
	@Id
	private int id;
	private String cname;
	private long phone;
	private String fromDate;
	private String toDate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public Booking(int id,String cname, long phone, String fromDate, String toDate) {
		super();
		this.id=id;
		this.cname = cname;
		this.phone = phone;
		this.fromDate = fromDate;
		this.toDate = toDate;
	}
	public Booking() {
		super();
	}
	@Override
	public String toString() {
		return "Booking [id=" + id + ", cname=" + cname + ", phone=" + phone + ", fromDate=" + fromDate + ", toDate="
				+ toDate + "]";
	}
	

}

