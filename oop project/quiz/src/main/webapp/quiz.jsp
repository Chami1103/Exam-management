<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quiz Participation</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/createquiz.css" />
    <style>
        .question-container {
            margin-top: 50px;
        }

        .options-container {
            margin-top: 20px;
        }
    </style>
</head>

<body>
    <div class="container">
       <header class="header">
    <h1 id="title" class="text-center">Quiz Participation</h1><br/>
    <button class="btn btn-primary" id="manageQuizBtn">Manage Questions</button>
        <div class="form-wrap" style="max-width: 850px;">
            <div class="container">
                <div id="quiz-container">
                    <div class="question-container">
                        <h4 id="question"></h4>
                    </div>
                    <form id="quizForm">
                        <div class="options-container" id="options-container">
                        </div>
                        <div class="button-container d-flex justify-content-between mt-4">
                            <button type="button" class="btn btn-primary" id="prevBtn"
                                onclick="prevQuestion()">Previous</button>
                            <button type="button" class="btn btn-primary" id="nextBtn"
                                onclick="nextQuestion()">Next</button>
                        </div>
                    </form>
                </div>

                <div id="score-container" class="mt-4"></div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.getElementById("manageQuizBtn").addEventListener("click", function() {
        window.location.href = "managequiz.jsp";
    });
        var currentQuestion = 0;
        var correctAnswers = 0;
        var questions = [];

        // Fetch questions from the server using AJAX
        $.ajax({
            url: "fetchAll", // URL of your servlet mapping
            type: "GET",
            dataType: "json",
            success: function(data) {
                questions = data;
                console.log(data);
                loadQuestion(); // Load the first question when data is fetched
            },
            error: function(error) {
                console.log(error);
            }
        });

        var questionElement = document.getElementById("question");
        var optionsContainer = document.getElementById("options-container");
        var prevBtn = document.getElementById("prevBtn");
        var nextBtn = document.getElementById("nextBtn");
        var quizForm = document.getElementById("quizForm");
        var quizContainer = document.getElementById("quiz-container");
        var scoreContainer = document.getElementById("score-container");

        // Function to load question and options
        function loadQuestion() {
            var currentQuizData = questions[currentQuestion];
            questionElement.textContent = currentQuizData.question;
            optionsContainer.innerHTML = "";

            var answers = [currentQuizData.answer1, currentQuizData.answer2, currentQuizData.answer3, currentQuizData.answer4];

            answers.forEach(function(option, index) {
                var optionDiv = document.createElement("div");
                optionDiv.classList.add("form-check");
                var inputRadio = document.createElement("input");
                inputRadio.classList.add("form-check-input");
                inputRadio.type = "radio";
                inputRadio.name = "answer";
                inputRadio.id = "option" + index;
                inputRadio.value = index;
                var label = document.createElement("label");
                label.classList.add("form-check-label");
                label.htmlFor = "option" + index;
                label.textContent = option;
                optionDiv.appendChild(inputRadio);
                optionDiv.appendChild(label);
                optionsContainer.appendChild(optionDiv);
            });

            if (currentQuestion === 0) {
                prevBtn.disabled = true;
            } else {
                prevBtn.disabled = false;
            }

            if (currentQuestion === questions.length - 1) {
                nextBtn.textContent = "Submit";
            } else {
                nextBtn.textContent = "Next";
            }
        }

        // Function to check the selected answer
        function checkAnswer() {
            var selectedAnswer = document.querySelector('input[name="answer"]:checked').value;
            var currentQuizData = questions[currentQuestion];

            if (selectedAnswer == currentQuizData.correct-1) {
                // Correct answer
                correctAnswers++;
            }
        }

        // Function to navigate to the next question
        function nextQuestion() {
            checkAnswer();
            currentQuestion++;
            if (currentQuestion < questions.length) {
                loadQuestion();
            } else {
                quizContainer.style.display = "none";
                var scorePercentage = (correctAnswers / questions.length) * 100;
                scoreContainer.textContent = "Your Score: " + correctAnswers + " out of " + questions.length;
                scoreContainer.style.fontWeight = "bold";
                scoreContainer.style.fontSize = "25px";

                var percentageContainer = document.createElement("div");
                percentageContainer.textContent = "Percentage: " + scorePercentage.toFixed(2) + "%";
                percentageContainer.style.fontSize = "30px";
                percentageContainer.style.color = "#2348ff";
                percentageContainer.style.marginTop = "10px";
                scoreContainer.appendChild(percentageContainer);
            }
        }

        // Function to navigate to the previous question
        function prevQuestion() {
            if (currentQuestion > 0) {
                currentQuestion--;
                loadQuestion();
            }
        }
    </script>
</body>

</html>
