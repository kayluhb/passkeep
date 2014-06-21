var APP = (function($, undefined) {
  'use strict';

  var app = {},
      $el,
      $search;

  // public functions
  // app.foo = function() {  };

  // private functions
  function init() {
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

    $(document)
      .on('page:change', initPage)
      .bind('keydown', 'shift+l', onSearchFocus);
  }

  function initPage() {
    $('a[href=#]').attr('href', 'javascript:;');

    // Open links starting with "http(s)://" in a new window unless they're targeted at this host.
    $("a[href^=http]")
      .off('click', open)
      .on('click', open);

    $('.chosen-select').chosen({
      allow_single_deselect: true,
      disable_search_threshold: 10,
      no_results_text: 'No results match',
      search_contains: true,
      width: '100%'
    });

    $search = $('#search');
    $search.autocomplete({
      serviceUrl: $search.data('url'),
      onSelect: function (suggestion) {
        window.location = suggestion.data;
      }
    });
  }

  function onSearchFocus() {
    $('#search')
      .val('')
      .focus();
    return false;
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
