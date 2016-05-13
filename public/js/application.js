$(document).ready(function() {
  $('.vote').on("submit", function(e){
    e.preventDefault();
    var url = e.target.action;
    var type = e.target.method;
    var ajaxRequest = $.ajax({
      url: url,
      type: type
    });
    ajaxRequest.done(function(response){
      var voteObject = JSON.parse(response);
      $(".total-points").text(voteObject.points);
    })
  });
  $('#ask-a-question-button').on("click", "a", function(e){
    e.preventDefault();
    $('#question-form').show();
  });
  $('#question-form').on("submit", function(e){
    e.preventDefault();
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    var ajaxRequest = $.ajax({
      url: url,
      type: type,
      data: data
    });
    ajaxRequest.done(function(response){
      $('#question-list').append(response);
    });
  });
    $('#add-answer-button').on("click", function(e){
    e.preventDefault();
    $(this).hide()
    $('#answer-form').show();
  });
  $('#answer-form').on("submit", function(e){
    e.preventDefault();
    $('#add-answer-button').show();
    $('#answer-form').hide();
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    var ajaxRequest = $.ajax({
      url: url,
      type: type,
      data: data
    });
    ajaxRequest.done(function(response){
      $('#answer-list').append(response);
    });
  });
  $('.add-answer-comment-link').on("click", function(e){
    e.preventDefault();
    $(this).hide()
    $('#' + this.parentElement.id + ' form').show();
  $('#' + e.target.parentElement.id + ' form').on("submit", function(e){
    e.preventDefault();
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    $.ajax({
      url: url,
      type: type,
      data: data
    }).done(function(response){
      $('#' + e.target.parentElement.id).children('ul').append(response);
      $('#' + e.target.parentElement.id + ' form').children('#answer-comment-description').val('');
    });
    });
  });
    $('.add-question-comment-link').on("click", function(e){
    e.preventDefault();
    $(this).hide()
    $('.question-comment-form').show();
  });
    $('.question-comment-form').on("submit", function(e){
    e.preventDefault();
    var data = $(e.target).serialize();
    var url = e.target.action;
    var type = e.target.method;
    var ajaxRequest = $.ajax({
      url: url,
      type: type,
      data: data
    });
    ajaxRequest.done(function(response){
      $('#question-comment-list').append(response);
      $('.question-comment-form').children().eq(0).val('');
    });
    });
});
