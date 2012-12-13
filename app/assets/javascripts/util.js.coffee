if !window.Quoty
  window.Quoty = {}

if !window.Quoty.Util
  window.Quoty.Util = {}

Quoty.Util =
  # Show twitter bootstrap style alert message.
  # -------------------------------------------------------------------
  # Usage:
  #   Quoty.Util.alert('body', "It works!");
  #   Quoty.Util.alert('body', "It works", {autoClose: false});
  #   Quoty.Util.alert('body', "It works", {autoClose: false, showCloseLink: true});
  #   Quoty.Util.alert('body', "Oops got error!", "error");
  #   Quoty.Util.alert('body', "Oops got error!", "error", {alertId: 'epicError'});
  # -------------------------------------------------------------------
  #
  # type: support valid twitter bootstrap alert css: "error", "success", "info", default: 'success'
  # message: message of alert
  # attachTo: accept valid jQuery selector, message will insert before the element
  # options:
  #   autoClose: true, false. if auto close the alert message html.
  #   closeTimer: timer for close message. default: 2 seconds
  #   alertClass: class for alert message html, default: ''.
  #   alertId: id for alert message html, default: ''.
  #   meessageClass: class for message block.
  #   showCloseLink:
  alert : (attachTo, message, type = 'success', options = {}) ->
    # make "type" ommittable
    if typeof (type) is "object"
      options = type
      type = 'success'

    # set up default options
    defaults =
      alertClass: ''
      alertId: ''
      meessageClass: 'no-margin'
      autoClose: true
      closeTimer: 2000

    # overwrite default options with user provided ones
    options = $.extend({}, defaults, options)

    to = $(attachTo) # cache it
    # if alert element exists, remote first
    if to.find(".alert").length > 0
      to.find(".alert").remove()

    # construct message html
    html = $('<div>').attr('id', options.alertId).addClass("alert alert-#{type} #{options.alertClass}")
    if options.showCloseLink
      html.append "<a class='close' href='#' data-dismiss='alert'>&times;</a>"
    html.append "<p class='#{options.meessageClass}'>#{message}</p>"

    # prepend message to element
    to.after html

    # timer to auto close
    if options.autoClose
      setTimeout ( ->
        $(".alert").fadeOut()
      ), options.closeTimer