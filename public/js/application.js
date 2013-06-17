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

  // delete a question from a survey
  $('#all-questions').on('click', '.delete-question', function(e) {
    e.preventDefault();
    var question = $(this).parent().parent();
    // question.fadeOut(300, function() { $(this).remove() });
    question.hide('blind', {}, 300, function() { $(this).remove() });

  });

  // add a choice to a question
  $('#all-questions').on('click', '.add-choice', function(e) {
    e.preventDefault();
    var choices = $(this).parent();
    choices.append(buildChoice(choices));
  });

  // delete a choice from a question
  $('#all-questions').on('click', '.delete-choice', function(e) {
    e.preventDefault();
    var totalChoices = $(this).parent().find('input').length;
    if (totalChoices >= 3) {
      var choice = $(this).parent().children().last();
      choice.remove();
    }
  });

  function buildQuestion() {
    var lastQuestion = $('#all-questions').children().last();
    var lastQuestionNum = 1;
    if (lastQuestion.length > 0) {
      lastQuestionNum = lastQuestion.children().find('.question').attr('name').match(/q(\d)/)[1];
    }
    var $question = $(questionTemplate);
    $question.find('.question').attr('name', function(i, val) {
      return val.replace('q1', 'q' + (parseInt(lastQuestionNum) + 1));
    });
    $question.find('.choice').attr('name', function(i, val) {
      return val.replace('q1', 'q' + (parseInt(lastQuestionNum) + 1));
    });
    return $question.hide().delay(1).fadeIn(300);//.effect('pulsate');
  }

  function buildChoice(choices) {
    var totalChoices = choices.find('input').length;
    totalChoices++;
    var lastChoice = choices.children().last();
    var newChoice = lastChoice.clone().attr('name', function(i, val) {
      return val.replace(/c\d/, 'c' + totalChoices);
    });
    return newChoice[0];
  }

  $("#all-questions").sortable({
    axis: 'y'
  });

  $('#sign-in-link').on('click', function(e) {
    e.preventDefault();
    $('.sign-in-box').css('display', 'inline-block');
  });

  $(window).scroll(function () {
    var scrollPosition = $(this).scrollTop();

    if (scrollPosition >= 20) {
      $('#top-box').addClass('fixed');
    }
    else {
      $('#top-box').removeClass('fixed');
    }
  });
});
