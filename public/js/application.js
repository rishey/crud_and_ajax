$(document).ready(function() {

  $('#new').click(function(event){
    //Browser...Don't go to this link, I got it.
    event.preventDefault();
    $(this).hide();
    var url = $(this).attr('href');

    $.get(url, function(response){
      $('.container').append(response);
    });
  });

  $('.container').on('submit', '#new-form', function(event){
    //Browser...Don't submit this...I've got it.
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();

    $.post(url, data, function(response){
      //add a table row
      $('tbody').append(response);
    });
    $(this).remove();
    $('h1:last-child').remove();
    $('#new').show();
  });

});
