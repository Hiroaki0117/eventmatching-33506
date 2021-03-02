window.onload = function(){ 
  $(function() {
    $('.slider').slick({
      autoplay: true,
      autoplaySpeed: 4000,
      arrow: true,
      dots: true,
      centerMode: true,
      centerPadding: "150px"
    });
  });
};