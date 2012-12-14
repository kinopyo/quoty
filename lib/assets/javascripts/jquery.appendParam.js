(function($){
  $.fn.setOrUpdateParam = function(key, value) {
    return this.each(function() {
      param = updateQueryStringParameter($(this).attr('href'), key, value);
      return $(this).attr('href', param);
    });
  };

  http://stackoverflow.com/questions/5999118/add-or-update-query-string-parameter
  function updateQueryStringParameter(uri, key, value) {
    var re = new RegExp("([?|&])" + key + "=.*?(&|$)", "i");
    separator = uri.indexOf('?') !== -1 ? "&" : "?";
    if (uri.match(re)) {
      return uri.replace(re, '$1' + key + "=" + value + '$2');
    }
    else {
      return uri + separator + key + "=" + value;
    }
  };
})(jQuery);
