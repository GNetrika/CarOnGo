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

@WebServlet("/bookcar")
public class BookCar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int carid = Integer.parseInt(req.getParameter("carid"));
        String customerName = req.getParameter("cname");
        long phone = Long.parseLong(req.getParameter("phone"));
        String fromdate = req.getParameter("fromdate");
        String toDate = req.getParameter("todate");

        EntityManagerFactory emf = Persistence.createEntityManagerFactory("CarOnGo");
        EntityManager em = emf.createEntityManager();
        EntityTransaction et = em.getTransaction();

        et.begin();

        Car c = em.find(Car.class, carid);

        Booking b = new Booking(carid, customerName, phone, fromdate, toDate);

        if (c != null) {
            c.setStatus("Booked");
        }

        em.merge(c);
        em.persist(b);

        et.commit();

        // SEND DATA TO JSP
        req.setAttribute("car", c);
        req.setAttribute("booking", b);

        RequestDispatcher rd = req.getRequestDispatcher("booksuccess.jsp");
        rd.forward(req, resp);
    }
}
