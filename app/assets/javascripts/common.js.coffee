$ ->
  $('input[placeholder], textarea[placeholder]').placeholder()

  $("abbr.timeago").timeago()

  $("a[data-remote]").each ->
    $(this).appendParam "ajax_id", @id