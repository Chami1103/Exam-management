package com.quiz;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ManageQuizServlet")
public class ManageQuizServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();

        try {
            List<Quiz> quiz = QuizDBUtil.getquestions();

            // Construct JSON manually
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < quiz.size(); i++) {
                Quiz q = quiz.get(i);
                json.append("{\"id\":").append(q.getId())
                    .append(",\"question\":\"").append(q.getQuestion()).append("\"")
                    .append(",\"answer1\":\"").append(q.getAnswer1()).append("\"")
                    .append(",\"answer2\":\"").append(q.getAnswer2()).append("\"")
                    .append(",\"answer3\":\"").append(q.getAnswer3()).append("\"")
                    .append(",\"answer4\":\"").append(q.getAnswer4()).append("\"")
                    .append(",\"correct\":").append(q.getCorrect())
                    .append("}");
                if (i < quiz.size() - 1) {
                    json.append(",");
                }
            }
            json.append("]");

            // Send the JSON response to the client
            out.print(json.toString());
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions properly, send appropriate error response if needed
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.print("Internal Server Error");
        } finally {
            out.close();
        }
    }
}
