package com.quiz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete/*")
public class deleteQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Extracting quiz ID from the request URL
        String[] uriParts = request.getRequestURI().split("/");
        int id = Integer.parseInt(uriParts[uriParts.length - 1]);

        // Delete the quiz question by ID
        boolean isDeleted = QuizDBUtil.deleteQuizById(id);

        if (isDeleted) {
            response.getWriter().write("Quiz question deleted successfully!");
        } else {
            response.getWriter().write("Failed to delete quiz question!");
        }
    }
}
