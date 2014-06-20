var APP = (function($, undefined) {
  'use strict';

  var app = {},
    $el;

  // public functions
  // app.foo = function() {  };

  // private functions
  function init() {
    $('a[href=#]').attr('href', 'javascript:;');

    // Open links starting with "http(s)://" in a new window unless they're targeted at this host.
    $("a[href^=http]").click(open);

    // Set up the global ajax
    $.ajaxSetup({
      cache: false,
      error: function errorLog(x, e) {
        if (typeof log !== 'undefined') {
          log(x, e);
        }
      },
      type: 'POST'
    });

    /*
    Yepnope is available through Modernizr.

    Yepnope example usage:

    yepnope([{
      test:Modernizr.csstransitions,
      nope:'/javascripts/app/css3.js'
    }]);
    */
  }

  function open(e) {
    var href = this.getAttribute('href');
    // If we're linking to a different domain, stop the normal behavior and open in a new window.
    if (window.location.host !== href.split('/')[2]) {
      e.preventDefault();
      window.open(href);
    }
  }

  // Call the init function on load
  $(init);
  return app;
} (jQuery));
