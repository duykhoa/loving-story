//= require application
//= require owl.carousel
//= require jquery
//= require fancybox

$(document).ready(function() {
  // create image slide for heading
  $("#owl-carousel").owlCarousel({
    singleItem:true,
    autoPlay: true
  });

  // auto set height of heading image slide
  $("#owl-carousel .item").css("height", $(window).height())

  // create member family slide
  $("#man-family, #woman-family").owlCarousel({
      singleItem:true,
      autoPlay: 10000
  });

  // Resize new windows for social click
  $(".social-wrapper a").click(function(){
    window.open(this.href, "popup", "width=800, height=500");
    return false;
  });
});

// Fancybox2 generate
$(".gallery").fancybox({
  openEffect: 'fade',
  closeEffect: 'fade'
});

// social plugin
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/vi_VN/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));
