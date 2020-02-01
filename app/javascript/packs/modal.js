$(document).on('turbolinks:load', function(){
  $('#bottom__form_btn').on('click', function() {
    $('#overlay, #modal_window').fadeIn(800);
  });
  $('#overlay, #window_close').on('click', function() {
    $('#overlay, #modal_window').fadeOut(800);
  });
}); 