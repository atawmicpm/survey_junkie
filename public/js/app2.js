$(document).ready(function () {
  var questionTemplate = $.trim($('#question-template').html());

  // send an HTTP DELETE request for the sign-out link
  $('a#sign-out').on("click", function (e) {
    e.preventDefault();
    var request = $.ajax({ url: $(this).attr('href'), type: 'delete' });
    request.done(function () { window.location = "/"; });
  });

  // add a new question to a survey
  $('#add-question').on('click', function(e) {
    e.preventDefault();
    $('#all-questions').append(buildQuestion());
  });

  $('#all-questions').on('click', '.add-choice', function(e) {
    e.preventDefault();
    var question = $(this).prev();
    question.append(buildChoice(question));
  });

  function buildQuestion() {
    var totalQuestions = $('.survey-question').length;
    var $question = $(questionTemplate);
    $question.find('input').attr('name', function(i, val) {
      return val.replace('q1', 'q' + totalQuestions);
    });
    return $question;
  }

  function buildChoice(question) {
    var totalChoices = question.find('input').length;
    var lastChoice = question.children().last();
    var newChoice = lastChoice.clone().attr('name', function(i, val) {
      return val.replace(/c\d/, 'c' + totalChoices);
    });
    return newChoice[0];
  }
});
