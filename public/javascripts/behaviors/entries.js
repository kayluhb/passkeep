var ENTRIES = (function($) {
    var app = {};
    app.init = function() {
        $("#entry_tag_tokens").tokenInput("/tags/search.json", {});
    };
    $(app.init);
    return app;
} (jQuery));