$ ->
  # expand comment textbox when focused,
  # restore it when blur and nothing is inputed
  $('#comment_content')
    .on 'focus', ->
      $(this).attr('rows', 3)
    .on 'blur', ->
      $(this).attr('rows', 1) if $(this).val() == ''

  # if url contains the #quote_comments hash, focus to comment textbox
  if $('#quote_comments').length > 0
    if location.hash == '#quote_comments'
      $('#comment_content').focus()

  if $('.quote_form').length > 0
    $('#quote_source, #quote_author').autocomplete
      source: (request, response) ->
        $.ajax
          method: 'get'
          url: '/wiki/search'
          data:
            query: request.term
          success: (data) ->
            wikis = []
            wikis.push {label: wiki.title, id: wiki.id} for wiki in data
            response(wikis)
          error: (data) ->
            response([])
      select: (event, ui) ->
        $('#quote_' + $(this).data('wiki-field')).val(ui.item.id)

  if $('#more_results').length
    $(this).click ->
      url = $(this).attr('href')
      $(this).text("Fetching more contents...")
      $.getScript(url)

