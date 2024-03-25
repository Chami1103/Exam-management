package com.quiz;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/quiz/CreateQuizServlet")
public class CreateQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String question = request.getParameter("question");
        String answer1 = request.getParameter("answer1");
        String answer2 = request.getParameter("answer2");
        String answer3 = request.getParameter("answer3");
        String answer4 = request.getParameter("answer4");
        String correctParam = request.getParameter("correct");

        System.out.println("Question: " + question);
        System.out.println("Answer 1: " + answer1);
        System.out.println("Answer 2: " + answer2);
        System.out.println("Answer 3: " + answer3);
        System.out.println("Answer 4: " + answer4);
        System.out.println("Correct Answer: " + correctParam);

        int correct = 0;

        try {
            correct = Integer.parseInt(correctParam);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        boolean isTrue;

        isTrue = QuizDBUtil.insertquiz(question, answer1, answer2, answer3, answer4, correct);

        if (isTrue) {
            RequestDispatcher dis = request.getRequestDispatcher("managequiz.jsp");
            dis.forward(request, response);
        } else {
            // Show an alert message if isTrue is false
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('Your error message here');</script>");
            response.sendRedirect("createquiz.jsp");
        }
    }
}
