ready = ->
  $('.ui.rating')
    .rating()

$(document).ready(ready)
$(document).on('page:load', ready)
