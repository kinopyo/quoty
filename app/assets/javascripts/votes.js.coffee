$ ->
  $('.popover_close').live 'click', (e) ->
    e.preventDefault()
    e.stopPropagation()
    $("##{$(this).data('ajax-id')}").popover('destroy')