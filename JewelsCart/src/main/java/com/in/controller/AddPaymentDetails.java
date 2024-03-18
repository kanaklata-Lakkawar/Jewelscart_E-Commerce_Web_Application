package com.in.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.in.model.Payment;
import com.in.model.Product;


public class AddPaymentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddPaymentDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		Configuration cfg = new Configuration();
		cfg.configure("hiber.cfg.xml");
		
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date expdt;
		
		try {
			expdt = formatter.parse(request.getParameter("expiryDate"));
			String formattedexp = new SimpleDateFormat("dd-MM-yyyy").format(expdt);
	        Payment p=new Payment(request.getParameter("email"),request.getParameter("item"),Integer.parseInt(request.getParameter("price")),Integer.parseInt(request.getParameter("qty")),request.getParameter("address"),Integer.parseInt(request.getParameter("pincode")), Long.parseLong(request.getParameter("cardNumber")), request.getParameter("cardHolderName"),Integer.parseInt(request.getParameter("cvv")),expdt,request.getParameter("image"));
	       
			
		    Transaction tx = session.beginTransaction();
			
			session.save(p);
			
			tx.commit();
			System.out.println("Data saved");
			request.setAttribute("message4", "Payment Successfully!");
			request.getRequestDispatcher("home.jsp").include(request, response);
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		    
		session.close();
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
