var TEAMS = (function($) {
    var app = {}, $el;
    // Public functions
    // app.foo = function() {  };
    // Private functions
    function init() {
        $('#team_search').autocomplete({ select:onTeamSelect, source:USER_SEARCH_URL });
    }
    function onTeamSelect(e, ui) {
        console.log('on team select')
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));