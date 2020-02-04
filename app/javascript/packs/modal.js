$(document).on('turbolinks:load', function(){
  $('#bottom__form_btn').on('click', function() {
    $('#overlay, #modal-window').fadeIn(800);
  });
  $('#window-close').on('click', function() {
    $('#overlay, #modal-window').fadeOut(800);
  });
}); 