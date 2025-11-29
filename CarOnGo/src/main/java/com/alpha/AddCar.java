package com.alpha;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addnewcar")
public class AddCar extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String carname=req.getParameter("carname");
		String model=req.getParameter("model");
		String owner=req.getParameter("owner");
		int price=Integer.parseInt(req.getParameter("price"));
		int car_no=Integer.parseInt(req.getParameter("carno"));
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("CarOnGo");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		Car c=new Car(carname, model, owner, price, car_no);
		et.begin();
		em.persist(c);
		et.commit();
		 req.setAttribute("name", carname);
	        req.setAttribute("model", model);
	        req.setAttribute("price", price);
	        req.setAttribute("owner", owner);
	        req.setAttribute("carno", car_no);

	        RequestDispatcher rd = req.getRequestDispatcher("caradded.jsp");
	        rd.forward(req, resp);
		
		}

}

