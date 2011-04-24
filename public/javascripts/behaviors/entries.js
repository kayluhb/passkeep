var ENTRIES = (function($) {
    var app = {}, $tags = $("#entry_tag_tokens");
    app.init = function() {
        var t = $tags.tokenInput("/tags/search.json", {  });
    };
    $(app.init);
    return app;
} (jQuery));