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
        $teamInput.autocomplete({ select:onTeamSelect, source:USER_SEARCH_URL });
        $projectInput.autocomplete({ select:onProjectSelect, source:PROJECT_SEARCH_URL });
    }
    function onTeamSelect(e, ui) {
        console.log('on team select', ui.item.id, ui.item.name);
        $teamList.append('<li id="team-' + ui.item.id + '">' + ui.item.name + '</li>');
    }
    function onProjectSelect(e, ui) {
        console.log('on project select', ui.item.id, ui.item.name);
        $projectList.append('<li id="project-' + ui.item.id + '">' + ui.item.name + '</li>');
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));