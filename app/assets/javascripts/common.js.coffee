$ ->
  $('input[placeholder], textarea[placeholder]').placeholder()

  $("a[data-remote]").each ->
    $(this).appendParam "ajax_id", @id