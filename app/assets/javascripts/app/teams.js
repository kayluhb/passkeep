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
        $('.close').live('click', onRemove)
    }
    function onProjectSelect(e, ui) {
        $projectList.append('<li id="project-' + ui.item.id + '"><a class="close" title="remove">&times;</a> ' + ui.item.name + '</li>');
    }
    function onRemove(e) {
        $(e.currentTarget).parent().remove();
    }
    function onTeamSelect(e, ui) {
        $teamList.append('<li id="team-' + ui.item.id + '"><a class="close" title="remove">&times;</a> ' + ui.item.name + '</li>');
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));