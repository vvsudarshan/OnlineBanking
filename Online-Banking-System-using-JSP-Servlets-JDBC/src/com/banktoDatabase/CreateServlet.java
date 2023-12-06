package com.banktoDatabase;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CreateServlet extends HttpServlet {
	
	public CreateServlet() {
        super();
	}

    private static final long serialVersionUID = 1L;

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String user_username = request.getParameter("username");
            String user_password = request.getParameter("password");
            String user_repassword = request.getParameter("repassword");

            String amoun = request.getParameter("amount");
            double user_amount = Double.parseDouble(amoun);

            String user_address = request.getParameter("address");

            String ph = request.getParameter("phone");
            double user_phone = Double.parseDouble(ph);

            int status = RegisterUser.register(user_username, user_password, user_repassword, user_amount, user_address, user_phone);

            if (status > 0) {
                out.print("Welcome! Your Account Has Opened");
                RequestDispatcher rd = request.getRequestDispatcher("index.html");
                rd.include(request, response);
            } else {
                out.print("Sorry, Registration failed. please try later");
                RequestDispatcher rd = request.getRequestDispatcher("Error_Register.jsp");
                rd.include(request, response);
            }
        } catch (NumberFormatException e) {
            out.print("Invalid input. Please enter a valid numeric value for the amount and phone.");
            e.printStackTrace(); // Log the exception for debugging
        } catch (Exception e) {
            out.print("An error occurred. Please try again later.");
            e.printStackTrace(); // Log the exception for debugging
        } finally {
            out.close();
        }
    }
}
