
var TEAMS = (function($) {
    var app = {}, $el, $teamInput = $('#team-search'), $teamList = $('#team-list'), $projectInput = $('#project-search'), $projectList = $('#project-list');
    // Public functions
    // app.foo = function() {  };
    // Private functions
    function init() {
        $('#team-list').teamList({ url:USER_SEARCH_URL });
        $('#project-list').teamList({ url:PROJECT_SEARCH_URL });
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));