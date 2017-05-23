ready = ->
  $('.message .close').on('click', 
    -> $(this).closest('.message').transition('fade')
  )

$(document).ready(ready)
$(document).on('page:load', ready)
