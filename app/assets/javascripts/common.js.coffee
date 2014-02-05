$ ->
  $('input[placeholder], textarea[placeholder]').placeholder()

  $("abbr.timeago").timeago()

  $(document).delegate "a[data-remote]", 'ajax:before', (e) ->
    $(this).setOrUpdateParam "ajax_id", @id

  $('.flash_message').slideDown().delay(3000).slideUp()

  NProgress.configure
    showSpinner: false
    ease: 'ease'
    speed: 500
