jQuery(document).on("ready page:load",function() {

//         jQuery(document).ready(function($) {
// (function($) {


//     var controller = new ScrollMagic.Controller()

    var introTl = new TimelineMax();
    introTl
        .from($('.hat'), 2, {autoAlpha: 0, yPercent: - 50, scale: 0.3}, 0)
        .to($('.bcg'), 1, {className:"+=is-loaded"}, 0);

        introTl.play();

//     var introScene = new ScrollMagic.Scene({
//         triggerElement: '.bcg'
//     })
//     .setTween(introTL)
//     .addTo(controller);



    // Darken intro bcg

    // var openingTl = new TimelineMax();

    // openingTl
    //     .to($('.bcg'), 0.2, {autoAlpha: 0, ease:Power1.easeNone})
    //     // .to($('.bcg'), 1.4, {y: '-10%', ease:Power1.easeOut}, '-=0.9')
    //     // .to($('.bcg'), 0.7, {autoAlpha: 0.5, ease:Power1.easeNone}, '-=1.95');

    // var openingScene = new ScrollMagic.Scene({
    //     triggerElement: '.bcg',
    //     triggerHook: 0,
    //     duration: "100%"
    // })
    // .setTween(openingTl)
    // .addTo(controller);

    // var layoutScene = new ScrollMagic.Scene({
    //     duration: 300,
    //     offset: 287,
    // })
    // .setTween()



var hamburger = $('#hamburger-closer');
var menulines = $('.menu-lines');
var lines = hamburger.children();

var menuTl = new TimelineMax({paused:true});

// Spread Out
menuTl.add(TweenMax.fromTo(lines[0], 0.1, {top:'0px'},{top:'-=5px'}), 0);
TweenMax.set(lines[1], {top:'10px'});
menuTl.add(TweenMax.fromTo(lines[2], 0.1, {top:'20px'}, {top:'+=5px'}), 0);
menuTl.add(TweenMax.to(lines[1], 0.1, {opacity:0}), 0.2);

// Rotate into X
menuTl.add(TweenMax.to(lines[0], 0.2, {top:'10px', rotation:'225deg'}), 0.1);
menuTl.add(TweenMax.to(lines[2], 0.2, {top:"10px", rotation:'-225deg'}), 0.1);

hamburger.click(function (){
     if( menuTl.progress()==0 ) {
        menuTl.play();
     } else {
        menuTl.reverse();
     }

     $('.header').toggleClass('menu-open');
     $('#side-nav').toggleClass('menu-open')
});

  $('.menu').on('click', function(event) {
    if (!$(event.target).is(hamburger)) {
      menuTl.reverse();
      $('#side-nav').removeClass('menu-open')
    }
  });

  $(document).on('click', function(){
    if (!$(event.target).is(menulines)) {
     $('#side-nav').removeClass('menu-open');
     menuTl.reverse();
    }
  });

    // var layoutTl = new TimelineMax();

    // layoutTl
    //     .to($('.blackcontent'), 0.1);



// 'X' click on or off
// var turn = 0;

// hamburger.on('click', function(){
//     if ( turn % 2 === 0) {
//         menuTl.play();
//         $('.mobilenav').fadeToggle(400);
//         $('body').toggleClass('.no-scroll');
//         hamburger.off('click','body')
//         turn++;
//     } else {
//         menuOut.play();
//         $('.mobilenav').fadeToggle(400);
//         console.log("fs")
//         turn++;
//     };

// });



    // hamburger.on('click', function(){
    //     menuTl.play();
    //     $('.mobilenav').fadeToggle(400);
    //     $('body').toggleClass('.no-scroll');

// Modal

    var modal = document.getElementById('myModal');
    var btn = $('.signup-button' );
    var span = document.getElementsByClassName('close')[0];
    var btn2 = $('.nav-section-list-signup')
    var enroll = $('nav-section-list-enroll')
    // var modal = $('myModal');
    // var btn = $('signup-button');
    // var span = $('close')[0];

    // btn.onclick = function() {
    //     console.log("fdsf")
    //     modal.style.display = "block";
    // };
    btn.add(btn2).on('click', function(e){
        e.preventDefault();
        modal.style.display = "block";
            $.ajax({
                url: 'login',
                method: 'get',
                dataType: 'html'
            }).done(function(data){
                $('.top-modal').html(data);
            })
    });

    span.onclick = function() {
        modal.style.display = "none";
    };

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };

    enroll.on('click', function(e){
        e.preventDefault();
        modal.style.display = "block";
    });

    span.onclick = function() {
        modal.style.display = "none";
    };

    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    };

    // btn.click(function(){
    //     modal.css({"display": "block"});
    // });

    // span.click(function() {
    //     modal.css({"display":"none"});
    // });

    // (modal, span).click(function(e){
    //     e.preventDefault();
    //     modal.fadeOut(400, function() {
    //         modal.remove();
    // });


// ( function( $ ) {
//     // Init Skrollr
//     var s = skrollr.init({
//         render: function(data) {
//             //Debugging - Log the current scroll position.
//             console.log(data.curTop);
//         }
    // });
// } )( jQuery );

});
