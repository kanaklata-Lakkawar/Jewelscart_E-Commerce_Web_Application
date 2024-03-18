package com.in.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.in.model.Product;


public class EditServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public EditServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int id = Integer.parseInt(request.getParameter("id"));
		 Configuration cfg = new Configuration();
			cfg.configure("hiber.cfg.xml");
			
			
			SessionFactory factory = cfg.buildSessionFactory();
			Session session = factory.openSession();
		
		    Transaction tx = session.beginTransaction();
		        Product p = session.get(Product.class, id);
		        if (p != null) {
		            // Update the fields
		            p.setCategory(request.getParameter("category"));
		            p.setDescription(request.getParameter("description"));
		            p.setItemname(request.getParameter("item"));
		            p.setMaterial(request.getParameter("material"));
		            p.setPrice(Integer.parseInt(request.getParameter("price")));
		            p.setQuantity(Integer.parseInt(request.getParameter("qty")));
		            
		            // Save the updated product
		            session.update(p);
		            tx.commit();
		            
		            // Log success
		            System.out.println("Product updated successfully");
		            
		            // Forward to success page
		            request.setAttribute("message2", "Item updated successfully!");
		            request.getRequestDispatcher("admin.jsp").forward(request, response);
		        } else {
		            // Log error
		            System.out.println("Product with ID " + id + " not found");

		            // Forward to error page
		            request.setAttribute("message2", "Item update failed. Product not found.");
		            request.getRequestDispatcher("admin.jsp").forward(request, response);
		        }
		    
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
