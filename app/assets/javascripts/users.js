// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
  $(document).on('ready page:load', function(){


    $('#search-form').submit(function(event){
      event.preventDefault();
      if("geolocation" in navigator){
        navigator.geolocation.getCurrentPosition(itWorked, itDidNotWork);
      }
    });

    $('.online-tutors').on('click', function(){
      $.ajax({
        url: '/users',
        method: 'get',
        dataType: 'script'
        });
      });


  });


  function itWorked (position){
    var lat = position.coords.latitude;
    var lon = position.coords.longitude;
    var searchValue = $('#search').val();
    $.ajax({
      url: '/users',
      method: 'get',
      data: {latitude: lat, longitude: lon, search: searchValue},
      dataType: 'script'

    })
  }

  function itDidNotWork (error){
    console.log(error.message);
  }
