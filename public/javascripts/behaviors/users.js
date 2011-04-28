var USERS = (function($) {
    var app = {}, $teams = $("#user_team_tokens");
    app.init = function() {
        var t = $teams.tokenInput("/teams/search.json", {  });
    };
    $(app.init);
    return app;
} (jQuery));