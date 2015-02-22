ready = ->
  $("#new_service_order").validate()

$(document).ready(ready)
$(document).on('page:load', ready)
