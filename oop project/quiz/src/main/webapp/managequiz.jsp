<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/createquiz.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // Fetch quiz data and populate the table
        $.ajax({
            url: "fetchAll",
            type: "GET",
            dataType: "json",
            success: function(data) {
                for (var i = 0; i < data.length; i++) {
                    var quiz = data[i];
                    var row = "<tr>" +
                        "<th scope='row'>" + quiz.id + "</th>" +
                        "<td class='text-truncate'>" + quiz.question + "</td>" +
                        "<td class='text-truncate'>" + quiz.answer1 + "</td>" +
                        "<td class='text-truncate'>" + quiz.answer2 + "</td>" +
                        "<td class='text-truncate'>" + quiz.answer3 + "</td>" +
                        "<td class='text-truncate'>" + quiz.answer4 + "</td>" +
                        "<td class='text-truncate'>" + quiz.correct + "</td>" +
                        "<td class='text-truncate'>" +
                        "<button class='btn btn-primary mx-1 edit-btn'>Edit</button>" +
                        "<button class='btn btn-danger mx-1 delete-btn'>Delete</button>" +
                        "</td>" +
                        "</tr>";
                    $("tbody").append(row);
                }

                // Add event listeners for edit and delete buttons
                $(".edit-btn").click(function() {
                    var id = $(this).closest("tr").find("th").text();
                    window.location.href = "editQuiz/" + id;
                });

                $(".delete-btn").click(function() {
                    var id = $(this).closest("tr").find("th").text();
                    var confirmDelete = confirm("Are you sure you want to delete this quiz?");
                    if (confirmDelete) {
                        $.ajax({
                            url: "deleteQuiz/" + id,
                            type: "DELETE",
                            success: function(response) {
                                alert("Quiz deleted successfully!");
                                window.location.reload();
                            },
                            error: function(error) {
                                console.error(error);
                            }
                        });
                    }
                });
            },
            error: function(error) {
                console.log(error);
            }
        });
    });
    </script>
</head>

<body>
    <div class="container">
        <header class="header">
            <h1 id="title" class="text-center">Manage Quiz</h1>
        </header>
        <div class="row">
            <div class="col-12">
                <a href="createquiz.jsp"><button id="add" class="btn btn-primary col-2  my-5 btn-block">Add a
                        Question</button></a>
            </div>
        </div>
        <div class="form-wrap" style="max-width: 100%;">
            <table class="table table-dark">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Question</th>
                        <th scope="col">Answer 1</th>
                        <th scope="col">Answer 2</th>
                        <th scope="col">Answer 3</th>
                        <th scope="col">Answer 4</th>
                        <th scope="col">Correct Answer</th>
                        <th scope="col">Actions</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
</body>

</html>
