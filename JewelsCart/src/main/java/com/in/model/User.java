package com.in.model;

import java.util.Date;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user_tbl")
public class User {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	@Column
	private String firstName;
	private String lastname;
	private String email;
    private String pass;
    private String gender;
    private Date dob;
	private long mob;

    public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
    public long getMob() {
        return mob;
    }

    public void setMob(long mob) {
        this.mob = mob;
    }
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public User(String firstName, String lastname, String email, String pass, String gender, Date dob, long mob) {
		super();
		this.firstName = firstName;
		this.lastname = lastname;
		this.email = email;
		this.pass = pass;
		this.gender = gender;
		this.dob = dob;
		this.mob = mob;
	}
	public User(int id,String firstName, String lastname, String email, String pass, String gender, Date dob, long mob) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastname = lastname;
		this.email = email;
		this.pass = pass;
		this.gender = gender;
		this.dob = dob;
		this.mob = mob;
	}
	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastname=" + lastname + ", email=" + email + ", pass=" + pass
				+ ", gender=" + gender + ", dob=" + dob + ", mob=" + mob + "]";
	}
	
    
}
