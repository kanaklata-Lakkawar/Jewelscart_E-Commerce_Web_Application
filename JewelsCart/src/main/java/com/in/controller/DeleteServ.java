package com.in.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.in.model.Product;

public class DeleteServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public DeleteServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id=Integer.parseInt(request.getParameter("pid"));
		Configuration cfg = new Configuration();
		cfg.configure("hiber.cfg.xml");
		
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
	
	    Transaction tx = session.beginTransaction();
		
		
		Product p= session.get(Product.class,id);
		if (id != 0) {
            session.delete(p); 
            tx.commit();
            System.out.println("Product deleted successfully");
        	System.out.println("Data Deleted");
        	session.close();
        	request.setAttribute("message", "Item Deleted Successfully!");
    		request.getRequestDispatcher("admin.jsp").forward(request, response);
        }
		
		
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
