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