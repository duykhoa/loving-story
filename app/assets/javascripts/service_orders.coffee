scrollTop = (targetTop, container = 'body', duration = 700) ->
  $(container).animate
    scrollTop: targetTop, duration

ready = ->
  $('#next-step-2').on 'click', (e) ->
    target = $("#step-2").offset().top
    scrollTop(target)

  $('#next-step-3').on 'click', (e) ->
    target = $("#step-3").offset().top
    scrollTop(target)

  $('#previous-step-1').on 'click', (e) ->
    target = 0
    scrollTop(target)

  $('#previous-step-2').on 'click', (e) ->
    target = $("#step-2").offset().top
    scrollTop(target)

$(document).ready(ready)
$(document).on('page:load', ready)
