//= require ../libs/jquery.custom-file

var ENTRY = (function($) {
    var app = {}, $el, evts = 'keyup unfocus blur update', stops = null;
    // Public functions
    // Private functions
    function init() {
        $('#entry_attachment').customFile({ element:'span', status:true, text: 'Choose Attachment' });
        $('#entry_url, #entry_title').on(evts, suggest);
        stops = _.union(APP.STOPS, $('#entry_tag_list').val().split(','));
    }
    function suggest() {
        var suggestions = $('#entry_url').val().split('.');
        suggestions = _.difference(suggestions, stops) 
        console.log('suggest', suggestions);
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));