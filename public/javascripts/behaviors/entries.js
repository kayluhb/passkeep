var ENTRIES = (function($) {
    var app = {}, $tags = $('#entry_tag_tokens'), $teams = $('#entry_team_tokens');
    app.init = function() {
        var t = $tags.tokenInput('/tags/search.json', {  });
        $teams.tokenInput('/teams/search.json', {  });
    };
    $(app.init);
    return app;
} (jQuery));