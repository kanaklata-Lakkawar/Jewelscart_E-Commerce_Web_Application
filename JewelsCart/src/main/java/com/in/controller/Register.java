package com.in.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.in.model.User;


public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date dateOfBirth;
		try {
			dateOfBirth = formatter.parse(request.getParameter("dob"));
		    String formattedDOB = new SimpleDateFormat("dd-MM-yyyy").format(dateOfBirth); // Format the date
			long mob = Long.parseLong(request.getParameter("mob"));

			String gender=request.getParameter("gender");
			
			Configuration cfg = new Configuration();
			cfg.configure("hiber.cfg.xml");
			
			
			SessionFactory factory = cfg.buildSessionFactory();
			Session session = factory.openSession();
			
	        User u=new User(fname,lname,email,pass,gender,dateOfBirth,mob);
			
			
		    Transaction tx = session.beginTransaction();
			
			session.save(u);
			
			tx.commit();
			
			System.out.println("Data saved");
			request.getRequestDispatcher("signin.jsp").forward(request, response);
			session.close();
		} catch (ParseException e) {
			
			e.printStackTrace();
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
