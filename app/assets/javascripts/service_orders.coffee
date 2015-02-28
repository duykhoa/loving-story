ready = ->
  $("#new_service_order").validate(
    errorElement: 'span'
    rules:
      "service_order[your_name]":
        minlength: 2
    errorPlacement:
      (error, element) ->
        console.log error
  )

$(document).ready(ready)
$(document).on('page:load', ready)
