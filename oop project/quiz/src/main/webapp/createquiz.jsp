<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Create a Quiz</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/createquiz.css" />
</head>

<body>
    <div class="container">
        <header class="header">
            <h1 id="title" class="text-center">Create a Question</h1>
        </header>
        <div class="form-wrap" style="max-width: 850px;">
            <form id="survey-form" action="add" method="post">
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label id="name-label" for="name">Question</label>
                            <input type="text" name="question" id="question" placeholder="Enter the Question"
                                class="form-control" required>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <label>Answers </label>
                            <div class="row">
                                <div class="col-6">
                                    <div class="form-group">
                                        <label id="name-label" for="name">Answer 1</label>
                                        <input type="text" name="answer1" id="answer1" placeholder="Enter First Answer"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label id="name-label" for="name">Answer 2</label>
                                        <input type="text" name="answer2" id="answer2" placeholder="Enter Second Answer"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label id="name-label" for="name">Answer 3</label>
                                        <input type="text" name="answer3" id="answer3" placeholder="Enter Third Answer"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <div class="form-group">
                                        <label id="name-label" for="name">Answer 4</label>
                                        <input type="text" name="answer4" id="answer4" placeholder="Enter Fourth Answer"
                                            class="form-control" required>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label id="name-label" for="name">Correct Answer</label>
                                        <input type="number" name="correct" id="correct"
                                            placeholder="Enter the number of correct Answer" class="form-control"
                                            required min="1" max="4">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-12">
                        <button type="submit" id="submit" class="btn btn-primary col-12 btn-block">Submit
                            Survey</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha384-KtLEoyIuZwB2D6f3oCMb8MjkpfGfKs6l1S1pVRAffIqJRWf/XFf8zyiKS9x4ks7x"
        crossorigin="anonymous"></script>
    <script>
    $(document).ready(function() {
        // Add an event listener to the form submit event
        $("#survey-form").on("submit", function(event) {
            // Prevent the default form submission behavior
            event.preventDefault();

            // Get the form data
            var formData = $(this).serialize();

            // Send the form data using AJAX
            $.ajax({
                type: "GET",
                url: "add",
                data: formData,
                success: function(response) {
                    // Handle the success response if needed
                    console.log(response);
                },
                error: function(error) {
                    // Handle the error response if needed
                    console.error(error);
                }
            });
        });
    });
</script>
</body>

</html>
