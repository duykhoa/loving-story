ready = ->
  $("#new_service_order").validate(
    errorElement: 'span'
    rules:
      "service_order[your_name]":
        minlength: 2
      "service_order[email]":
        minlength: 2

    errorPlacement:
      (error, element) ->
        errorDiv = $('<span>', { class: 'error-icon fa fa-exclamation-triangle' })
        $(errorDiv).tooltip(
          title: error.text()
          placement: 'bottom'
          container: 'body'
        )

        $(element).parent().children().remove('.error-icon')
        $(element).parent().append(errorDiv)

    success:
      (label, element) ->
        $(element).parent().children().remove('.error-icon')
  )

$(document).ready(ready)
$(document).on('page:load', ready)
