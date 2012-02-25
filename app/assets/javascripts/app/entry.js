//= require ../libs/jquery.custom-file

var ENTRY = (function($) {
    var app = {}, $el;
    // Public functions
    // app.foo = function() {  };
    // Private functions
    function init() {
        $('#entry_attachment').customFile({ element:'span', status:true, text: 'Choose Attachment' });
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));