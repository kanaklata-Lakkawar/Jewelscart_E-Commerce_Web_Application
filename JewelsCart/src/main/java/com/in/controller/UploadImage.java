package com.in.controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.in.model.Product;




@MultipartConfig
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UploadImage() {
        super();
        
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession h=request.getSession();
		String email=(String) h.getAttribute("email");
    	Part file=request.getPart("image");
    	 if (file == null) {
    	        // Handle the case where the Part object is null
    	        response.getWriter().println("No file selected.");
    	        return;
    	    }
		String imageFileName=getSubmittedFileName(file);
		//file:///D:/javapro/E_Jwellery/src/main/webapp/upload/download.jpeg
		String uploadPath="D:/javapro/E_Jwellery/src/main/webapp/upload/"+imageFileName;
		System.out.println("Image name : "+imageFileName);
		System.out.println("Path : "+uploadPath);
		try
		{
			
		FileOutputStream fos=new FileOutputStream(uploadPath);
		InputStream is=file.getInputStream();
		
		byte[] data=new byte[is.available()];
		is.read(data);
		fos.write(data);
		fos.close();
		}
		catch (Exception e) {

			e.printStackTrace();
		}
	
		
		//Database Code
		
		
		HttpSession hItem=request.getSession();
		
		
		
		
		String item=(String) h.getAttribute("item");
		System.out.println(item+" My item");
		
		Configuration cfg = new Configuration();
		cfg.configure("hiber.cfg.xml");
		
		
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		
        //Product u=new Product(item,request.getParameter("description"),request.getParameter("category"),request.getParameter("material"),Integer.parseInt(request.getParameter("price")),Integer.parseInt(request.getParameter("quantity")));
       
		
	    Transaction tx = session.beginTransaction();
	    Product p = session.get(Product.class, 2);
        if (p != null) {
            p.setImageName(imageFileName);
            session.update(p);
            tx.commit();
		
		session.update(p);
        
		tx.commit();
		
		System.out.println("Data saved");
        }
	
		session.close();
		
			
		
		//Show uploaded image on page
		
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		out.print("<img src='"+uploadPath+"' alt='Uploaded Image'>");
		request.getRequestDispatcher("home.jsp").forward(request, response);
		
    	
	}
	private static String getSubmittedFileName(Part part) {
	    for (String cd : part.getHeader("content-disposition").split(";")) {
	        if (cd.trim().startsWith("filename")) {
	            String fileName = cd.substring(cd.indexOf('=') + 1).trim().replace("\"", "");
	            return fileName.substring(fileName.lastIndexOf('/') + 1).substring(fileName.lastIndexOf('\\') + 1); // MSIE fix.
	        }
	    }
	    return null;
	}

}
