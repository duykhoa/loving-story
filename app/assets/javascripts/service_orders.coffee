ready = ->
  $("#new_service_order").validate(
    errorElement: 'span'
    rules:
      "service_order[your_name]":
        minlength: 2
      "service_order[email]":
        minlength: 2
      "service_order[his_name]":
        minlength: 2
        maxlength: 100
      "service_order[her_name]":
        minlength: 2
        maxlength: 100
      "service_order[his_story]":
        minlength: 5
        maxlength: 400
      "service_order[her_story]":
        minlength: 5
        maxlength: 400
      "service_order[our_relationship]":
        minlength: 5
        maxlength: 400
      "service_order[header_image]":
        filesize: '2MB'
      "service_order[domain]":
        pattern: /^([a-z0-9]){3,20}$/

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
