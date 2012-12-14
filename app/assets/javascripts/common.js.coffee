$ ->
  $('input[placeholder], textarea[placeholder]').placeholder()

  $("abbr.timeago").timeago()

  $(document).delegate "a[data-remote]", 'ajax:before', (e) ->
    $(this).setOrUpdateParam "ajax_id", @id