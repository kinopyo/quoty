$(document).on 'click', '.popover_close', (e) ->
  e.preventDefault()
  e.stopPropagation()
  $("##{$(this).data('ajax-id')}").popover('destroy')
