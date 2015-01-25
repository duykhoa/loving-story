ready = ->
	$('#next-step-2').on 'click', (e) ->
    target = $("#step-2").offset().top

    $('body').animate
      scrollTop: target, 700

  $('#next-step-3').on 'click', (e) ->
    target1 = $("#step-3").offset().top
    $('body').animate
      scrollTop: target1, 700

  $('#previous-step-1').on 'click', (e) ->
    $('body').animate
      scrollTop: 0, 700

  $('#previous-step-2').on 'click', (e) ->
    target = $("#step-2").offset().top

    $('body').animate
      scrollTop: target, 700

$(document).ready(ready)
$(document).on('page:load', ready)
