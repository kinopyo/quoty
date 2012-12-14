$ ->
  $(document).delegate '.popover_close', 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()
    $("##{$(this).data('ajax-id')}").popover('destroy')