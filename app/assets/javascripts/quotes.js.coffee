$ ->
  # expand comment textbox when focused,
  # restore it when blur and nothing is inputed
  $('#comment_content')
    .on 'focus', ->
      $(this).attr('rows', 3)
    .on 'blur', ->
      $(this).attr('rows', 1) if $(this).val() == ''