jQuery ->
  $("a[rel=popover]").popover()

  # have to make this behaves like .live() function, handle generated on-the-fly element.
  $(".tip").tooltip()
  $("a[rel=tooltip]").tooltip()