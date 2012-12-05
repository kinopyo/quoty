(function($){
  // http://stackoverflow.com/a/2667566/219065
  $.fn.appendParam = function(key, value) {
    return this.each(function() {
      var param = key + '=' + value;
      $(this).attr('href', function(index, href) {
        return href + (href.indexOf('?') != -1 ? "&" + param : "?" + param);
      });
    });
  };
})(jQuery);