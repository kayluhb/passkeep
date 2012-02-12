var TEAMS = (function($) {
    var app = {}, $el, $teamInput = $('#team-search'), $projectInput = $('#project-search');
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
        $teamInput.autocomplete({ select:onTeamSelect, source:USER_SEARCH_URL });
        $projectInput.autocomplete({ select:onProjectSelect, source:PROJECT_SEARCH_URL });
    }
    function onTeamSelect(e, ui) {
        console.log('on team select', ui.item.id, ui.item.name);
        $teamInput.val(ui.item.name)
            .data('id', ui.item.id)
            .data('name', ui.item.name);
    }
    function onProjectSelect(e, ui) {
        console.log('on project select', ui.item.id, ui.item.name);
        $projectInput.val(ui.item.name)
            .data('id', ui.item.id)
            .data('name', ui.item.name);
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));