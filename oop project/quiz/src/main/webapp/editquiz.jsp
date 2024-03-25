<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Edit Quiz Question</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>

<body>
    <div class="container">
        <header class="header">
            <h1 id="title" class="text-center">Edit Question</h1>
        </header>
        <div class="form-wrap" style="max-width: 850px;">
            <form id="survey-form">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label id="name-label" for="question">Question</label>
                            <input type="text" name="question" id="question" class="form-control" required>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-6">
                        <div class="form-group">
                            <label id="name-label" for="answer1">Answer 1</label>
                            <input type="text" name="answer1" id="answer1" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label id="name-label" for="answer2">Answer 2</label>
                            <input type="text" name="answer2" id="answer2" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label id="name-label" for="answer3">Answer 3</label>
                            <input type="text" name="answer3" id="answer3" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <label id="name-label" for="answer4">Answer 4</label>
                            <input type="text" name="answer4" id="answer4" class="form-control" required>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label id="name-label" for="correct">Correct Answer (1-4)</label>
                            <input type="number" name="correct" id="correct" class="form-control" required min="1"
                                max="4">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <button type="button" id="submit" class="btn btn-primary col-12 btn-block">Update Question</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            // Fetch question data by making an AJAX request to getquiz/:id
            $.ajax({
                type: "GET",
                url: "getQuiz/:id", // Replace :id with the actual question ID
                success: function (data) {
                    // Populate form fields with the fetched data
                    $("#question").val(data.question);
                    $("#answer1").val(data.answer1);
                    $("#answer2").val(data.answer2);
                    $("#answer3").val(data.answer3);
                    $("#answer4").val(data.answer4);
                    $("#correct").val(data.correct);
                },
                error: function (error) {
                    console.error(error);
                }
            });

            // Add click event listener to the submit button
            $("#submit").on("click", function (event) {
                // Get the updated form data
                var updatedData = {
                    question: $("#question").val(),
                    answer1: $("#answer1").val(),
                    answer2: $("#answer2").val(),
                    answer3: $("#answer3").val(),
                    answer4: $("#answer4").val(),
                    correct: $("#correct").val()
                };

                // Send the updated data to the server using AJAX for updating the question
                $.ajax({
                    type: "POST",
                    url: "updatequiz/:id", // Replace :id with the actual question ID
                    data: updatedData,
                    success: function (response) {
                        // Handle the success response if needed
                        console.log(response);
                    },
                    error: function (error) {
                        // Handle the error response if needed
                        console.error(error);
                    }
                });
            });
        });
    </script>
</body>

</html>
