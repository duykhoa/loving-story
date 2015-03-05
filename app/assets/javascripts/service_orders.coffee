ready = ->
  $("#new_service_order").validate(
    errorElement: 'span'
    ignore: ""
    rules:
      "service_order[your_name]":
        minlength: 2
        required: true
      "service_order[email]":
        minlength: 2
        required: true
      "service_order[his_name]":
        minlength: 2
        maxlength: 100
        required: true
      "service_order[her_name]":
        minlength: 2
        maxlength: 100
        required: true
      "service_order[his_story]":
        minlength: 5
        maxlength: 400
        required: true
      "service_order[her_story]":
        minlength: 5
        maxlength: 400
        required: true
      "service_order[our_relationship]":
        minlength: 5
        maxlength: 400
        required: true
      "service_order[header_image]":
        filesize: '2MB'
        required: true
      "service_order[domain]":
        pattern: /^([a-z0-9]){3,20}$/
        required: true
        remote:
          url: "/service_orders/valid"
          type: "post"
          data:
            service_order:
              domain: ->
                $("#service_order_domain").val()

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

    messages:
      "service_order[domain]":
        remote: "Domain is existed. Please choose another one."
  )

$(document).ready(ready)
$(document).on('page:load', ready)
