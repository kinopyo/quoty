$(document)
  .on 'page:fetch', ->
    $('.main_content').addClass('loading')
  .on 'page:receive', ->
    $('.main_content').removeClass('loading')

