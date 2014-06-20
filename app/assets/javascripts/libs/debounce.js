/*

Requirements:

  /javascripts/libs/request-interval.js

Example usage:

  <script>

    var layoutBounce = debounce(layout, 500);
    $(window).on('resize', layoutBounce);
    layout();

  </script>
*/

var debounce = function(func, wait, immediate) {
  var timeout = {};
  return function() {
    var context = this,
        args = arguments;

    var later = function() {
      timeout = {};
      if (!immediate) func.apply(context, args);
    };

    var callNow = immediate && !timeout;
    clearRequestTimeout(timeout);
    timeout = requestTimeout(later, wait);
    if (callNow) func.apply(context, args);
  };
};
