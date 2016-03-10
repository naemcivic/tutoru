// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('ready page:load', function(){
  $('#search_nearby').on('click',function(){
    if("geolocation" in navigator){
      navigator.geolocation.getCurrentPosition(itWorked, itDidNotWork);
    }
  });
});


function itWorked (position){
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;
  $.ajax({
    url: '/users',
    method: 'get',
    data: {latitude: lat, longitude: lon},
    dataType: 'script'

  })
}

function itDidNotWork (error){
  console.log(error.message);
}

$(document).on('page:change', function(){

  $('#appointment_appointment_date').multiDatesPicker({
    dateFormat: "yy-mm-dd"
  });

  $('#user_profile_attributes_availability').multiDatesPicker({
    dateFormat: "yy-mm-dd"
  });
});
