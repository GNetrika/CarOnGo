package com.alpha;

import java.io.IOException;
import java.util.List;

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

@WebServlet("/seeallavailablecars")
public class SeeAllAvailableCars extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		EntityManagerFactory emf=Persistence.createEntityManagerFactory("CarOnGo");
		EntityManager em=emf.createEntityManager();
		EntityTransaction et=em.getTransaction();
		et.begin();
		String query="Select c from Car c where c.status='Available'";
		List<Car> result=em.createQuery(query).getResultList();
		req.setAttribute("carlist", result);
		RequestDispatcher requestDispatcher=req.getRequestDispatcher("displayallavailablecars.jsp");
		requestDispatcher.forward(req, resp);
		et.commit();
	}

}
