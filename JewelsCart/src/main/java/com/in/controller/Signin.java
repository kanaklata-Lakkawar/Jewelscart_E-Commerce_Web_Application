package com.in.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;




public class Signin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Signin() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Configuration cfg = new Configuration();
		cfg.configure("hiber.cfg.xml");
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		Transaction tx = session.beginTransaction();
		
		
		String email=request.getParameter("email");
		String pswd=request.getParameter("password");
		
		
		HttpSession h=request.getSession();
		h.setAttribute("email", email);
		h.setAttribute("pass", pswd);
	
		
		Query q=session.createQuery("from User where email=:email and pass=:pass");
		q.setParameter("email", email);
		q.setParameter("pass", pswd);
		
		com.in.model.User u=(com.in.model.User) q.uniqueResult();
		
		q.setParameter("email", email);
		q.setParameter("pass", pswd);
		if(u!=null){
			request.setAttribute("message", "User Registered Successfully!");
			request.setAttribute("message1", "User Login Successfully!");
			request.getRequestDispatcher("home.jsp").forward(request, response);
		}
		else
			request.setAttribute("message2", "User Not Found Please Register First");
			request.getRequestDispatcher("signup.jsp").forward(request, response);
				
		tx.commit();
		session.close();
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
