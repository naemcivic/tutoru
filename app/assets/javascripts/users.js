// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page :load', function() {
  $('#serach-form').submit(function(e) {
    e.preventDefault();
    var searchValue = $('#search').val();
    $.getScript('/products?search=' + searchValue);
  });

});

$(document).on('page:change', function(){

  $('#user_profile_attributes_availability').datepicker();
});
