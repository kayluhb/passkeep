var TEAMS = (function($) {
    var app = {}, $el;
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
        $('#team_search').autocomplete({ select:onTeamSelect, source:USER_SEARCH_URL });
    }
    function onTeamSelect(e, ui) {
        console.log('on team select', ui, ui.item);
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));