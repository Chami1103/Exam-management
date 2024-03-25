package com.quiz;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

public class QuizDBUtil {
	
	 private static final String URL = "jdbc:mysql://localhost:3306/quiz";
	    private static final String USER = "root";
	    private static final String PASSWORD = "Drs200023##";
	    public static List<Quiz> getquestions(){
	        List<Quiz> quiz = new ArrayList<>();

	        try {
	        	Class.forName("com.mysql.cj.jdbc.Driver");

	            Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
	            Statement stmt = con.createStatement();

	            String sql = "SELECT * FROM questions";
	            ResultSet rs = stmt.executeQuery(sql);

	            while (rs.next()) {
	                int id = rs.getInt(1);
	                String question = rs.getString(2);
	                String answer1 = rs.getString(3);
	                String answer2 = rs.getString(4);
	                String answer3 = rs.getString(5);
	                String answer4 = rs.getString(6);
	                int correct = rs.getInt(7);

	                Quiz q = new Quiz(id, question, answer1, answer2, answer3, answer4, correct);
	                quiz.add(q);
	            }

	            // Close the ResultSet, Statement, and Connection
	            rs.close();
	            stmt.close();
	            con.close();
	        } catch(Exception e) {
	            e.printStackTrace();
	        }

	        return quiz;
	    }

public static List<Quiz> getOneQuestion(int id) {
    List<Quiz> quizList = new ArrayList<>();

    try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
        String sql = "SELECT * FROM questions WHERE id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, id);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            int questionId = resultSet.getInt("id");
            String question = resultSet.getString("question");
            String answer1 = resultSet.getString("answer1");
            String answer2 = resultSet.getString("answer2");
            String answer3 = resultSet.getString("answer3");
            String answer4 = resultSet.getString("answer4");
            int correct = resultSet.getInt("correct");

            Quiz q = new Quiz(questionId, question, answer1, answer2, answer3, answer4, correct);
            quizList.add(q);
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return quizList;
}
public static boolean updateQuiz(int id, String question, String answer1, String answer2, String answer3, String answer4, int correct) {
    try (Connection connection = DriverManager.getConnection(URL,USER,PASSWORD)) {
        String sql = "UPDATE questions SET question=?, answer1=?, answer2=?, answer3=?, answer4=?, correct=? WHERE id=?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, question);
            statement.setString(2, answer1);
            statement.setString(3, answer2);
            statement.setString(4, answer3);
            statement.setString(5, answer4);
            statement.setInt(6, correct);
            statement.setInt(7, id);

            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return false;
}

public static boolean insertquiz(String question,String answer1,String answer2,String answer3,String answer4,int correct) {

boolean isSuccess=false;

//String url="jdbc:mysql://localhost:3306/quiz";
//String user="root";
//String password="Drs200023##";

try {

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	String sql = "INSERT INTO questions VALUES (NULL, ?, ?, ?, ?, ?, ?)";
	try (Connection con = DriverManager.getConnection(URL, USER,PASSWORD);
	     PreparedStatement pstmt = con.prepareStatement(sql)) {

	    pstmt.setString(1, question);
	    pstmt.setString(2, answer1);
	    pstmt.setString(3, answer2);
	    pstmt.setString(4, answer3);
	    pstmt.setString(5, answer4);
	    pstmt.setInt(6, correct);

	    int rs = pstmt.executeUpdate();

	    if (rs > 0) {
	        isSuccess = true;
	    }

	} catch (Exception e) {
	    e.printStackTrace();
	}

}catch(Exception e) {
	e.printStackTrace();
}
return isSuccess;
}
public static boolean deleteQuizById(int id) {
    boolean rowDeleted = false;

    try (Connection connection = DriverManager.getConnection(URL, USER,PASSWORD)) {
        String sql = "DELETE FROM questions WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return rowDeleted;
}
}
