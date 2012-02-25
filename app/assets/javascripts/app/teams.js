
var TEAMS = (function($) {
    var app = {}, $el, $teamInput = $('#team-search'), $teamList = $('#team-list'), $projectInput = $('#project-search'), $projectList = $('#project-list');
    // Public functions
    // app.foo = function() {  };
    // Private functions
    function init() {
        $.ui.autocomplete.prototype._renderItem = function(ul, item) {
            var re = new RegExp("^" + this.term, "gm"),
            t = item.name.replace(re, '<span class="highlight">' + this.term + '</span>');
            return $('<li></li>')
                .data('item.autocomplete', item)
                .append('<a>' + t + '</a>')
                .appendTo(ul);
        };
        $('#team-list').teamList({ url:USER_SEARCH_URL });
        $('#project-list').teamList({ url:PROJECT_SEARCH_URL });
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));