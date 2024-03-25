package com.quiz;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet("/getOneQuestion")
public class GetOneQuestionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        // Retrieve the id parameter from the request
        int questionId = Integer.parseInt(request.getParameter("id"));

        // Call the getOneQuestion method from DBUtil
        List<Quiz> quizList = QuizDBUtil.getOneQuestion(questionId);

        // Convert the quizList to JSON manually and send it as the response
        StringBuilder json = new StringBuilder("[");
        for (int i = 0; i < quizList.size(); i++) {
            Quiz quiz = quizList.get(i);
            json.append("{");
            json.append("\"id\":\"").append(quiz.getId()).append("\",");
            json.append("\"question\":\"").append(quiz.getQuestion()).append("\",");
            json.append("\"answer1\":\"").append(quiz.getAnswer1()).append("\",");
            json.append("\"answer2\":\"").append(quiz.getAnswer2()).append("\",");
            json.append("\"answer3\":\"").append(quiz.getAnswer3()).append("\",");
            json.append("\"answer4\":\"").append(quiz.getAnswer4()).append("\",");
            json.append("\"correct\":\"").append(quiz.getCorrect()).append("\"");
            json.append("}");

            if (i < quizList.size() - 1) {
                json.append(",");
            }
        }
        json.append("]");

        out.print(json.toString());
        out.flush();
    }
}
