package com.alpha;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Car {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
		private int id;
		private String name;
		private String model;
		private String owner;
		private int price;
		private int carno;
		private String status="Available";
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getModel() {
			return model;
		}
		public void setModel(String model) {
			this.model = model;
		}
		public String getOwner() {
			return owner;
		}
		public void setOwner(String owner) {
			this.owner = owner;
		}
		public int getPrice() {
			return price;
		}
		public void setPrice(int price) {
			this.price = price;
		}
		public int getCarno() {
			return carno;
		}
		public void setCarno(int carno) {
			this.carno = carno;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public Car(String name, String model, String owner, int price, int carno) {
			super();
			this.name = name;
			this.model = model;
			this.owner = owner;
			this.price = price;
			this.carno = carno;
		}
		public Car() {
			super();
		}
		@Override
		public String toString() {
			return "Car [id=" + id + ", name=" + name + ", model=" + model + ", owner=" + owner + ", price=" + price
					+ ", carno=" + carno + ", status=" + status + "]";
		}


}
