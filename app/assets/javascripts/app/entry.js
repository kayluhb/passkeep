//= require ../libs/jquery.custom-file

var ENTRY = (function($) {
    var app = {}, $el, $et = $('#entry_title'), evts = 'keyup unfocus blur update', stops = null;
    // Public functions
    // Private functions
    function init() {
        $('#entry_attachment').customFile({ element:'span', status:true, text: 'Choose Attachment' });
        $('#entry_url, #entry_title').on(evts, suggest);
        stops = _.union(APP.STOPS, $('#entry_tag_list').val().split(', '));
    }
    function suggest() {
        var suggestions = $('#entry_url').val().split('http://').join('').split('https://').join('').split('.');
        suggestions.push($et.val());
        //sugesstions = _.union(suggestions, $et.val().split(' '));
        suggestions = _.difference(suggestions, stops);
        suggestions = _.reject(suggestions, function(val){ return val.length < 3; });
        console.log('suggest', _.uniq(suggestions));
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));