var TEAMS = (function($) {
    var app = {}, $users = $("#team_user_tokens");
    app.init = function() {
        var t = $users.tokenInput("/users/search.json", {  });
    };
    $(app.init);
    return app;
} (jQuery));