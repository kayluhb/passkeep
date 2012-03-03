//= require ../libs/jquery.custom-file

var ENTRY_IMPORT = (function($) {
    var app = {}, $el;
    // Public functions
    // Private functions
    function init() {
        $('#entry_import_attachment').customFile({ element:'span', status:true, text: 'Choose CSV' });
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));

