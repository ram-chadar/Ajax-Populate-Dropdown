package com.model;

import java.util.Arrays;

import javax.servlet.http.Part;

public class Employee {
	
	private String eid;
	private String name;
	private String gender;
	private String country;
	private String state;
	private String city;
	private String[] technologies;
	
	private Part image;
	
	
	public Employee() {
		// TODO Auto-generated constructor stub
	}

	
	
	public Employee(String eid, String name, String gender, String country, String state, String city,
			String[] technologies,Part image) {
		super();
		this.eid = eid;
		this.name = name;
		this.gender = gender;
		this.country = country;
		this.state = state;
		this.city = city;
		this.technologies = technologies;
		this.image=image;
	}



	public String getEid() {
		return eid;
	}

	public void setEid(String eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String[] getTechnologies() {
		return technologies;
	}

	public void setTechnologies(String[] technologies) {
		this.technologies = technologies;
	}



	public Part getImage() {
		return image;
	}



	public void setImage(Part image) {
		this.image = image;
	}



	@Override
	public String toString() {
		return "Employee [eid=" + eid + ", name=" + name + ", gender=" + gender + ", country=" + country + ", state="
				+ state + ", city=" + city + ", technologies=" + Arrays.toString(technologies) + ", image=" + image
				+ "]";
	}
	
	
	
	
}
