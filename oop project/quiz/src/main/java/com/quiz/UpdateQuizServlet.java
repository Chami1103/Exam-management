package com.quiz;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateQuizServlet/*")
public class UpdateQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String question = request.getParameter("question");
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");
        String correctParam = request.getParameter("correct");

        int id = Integer.parseInt(request.getParameter("id")); // Assuming you also pass the ID of the question to be updated

        int correct = 0;

        try {
            correct = Integer.parseInt(correctParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        boolean isTrue;

        // Assuming QuizDBUtil.updateQuiz method is available to update the quiz question by its ID
        isTrue = QuizDBUtil.updateQuiz(id, question, answer1, answer2, answer3, answer4, correct);

        if (isTrue) {
            response.sendRedirect("managequiz.jsp");
        } else {
            // Show an alert message if isTrue is false
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<script>alert('Your error message here');</script>");
            response.sendRedirect("editquiz.jsp"); // Redirect to the edit page if the update fails
        }
    }
}
