package com.alpha;

import java.io.IOException;

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

@WebServlet("/completebooking")
public class CompleteBooking extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("CarOnGo");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		int carid=Integer.parseInt(req.getParameter("carid"));
		et.begin();
		Booking b=em.find(Booking.class, carid);
		Car c=em.find(Car.class, carid);
		if(b!=null) {
			c.setStatus("Available");
			em.remove(b);
		}
		em.merge(c);
		et.commit();
		req.setAttribute("car", c);

        RequestDispatcher rd = req.getRequestDispatcher("bookingcompleted.jsp");
        rd.forward(req, resp);
	}

}
