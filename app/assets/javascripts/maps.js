function initMap(){
  var mapPlaceHolder = $('#show-map');
  var latLong = {lat: mapPlaceHolder.data('latitude'), lng: mapPlaceHolder.data('longitude')};
  var map = new google.maps.Map(mapPlaceHolder[0],{
    center: latLong,
    zoom: 14
  });

  var marker = new google.maps.Marker({
    position: latLong,
    map: map,
    title: 'Hello World!'
  });
}
