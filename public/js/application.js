$(document).ready(function() {
  $('#ask-a-question-button').on("click", "a", function(e){
    e.preventDefault();
    $(this).hide()
    $('#question-form').show();
  });
  $('#question-form').on("submit", function(e){
    e.preventDefault();
    var $newQuestion = $(this)
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    var ajaxRequest = $.ajax({
      url: url,
      type: type,
      data: data
    });
    ajaxRequest.done(function(response){
      var questionObject = JSON.parse(response)
      var questionLink = $('#question-list').find("a").eq(0).clone();
      questionLink.text(questionObject.question.title)
      questionLink.attr("href", "/questions/" + questionObject.id)
      $('#question-list').append(questionLink);
    });
  });
});
