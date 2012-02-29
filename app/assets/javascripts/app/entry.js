//= require ../libs/jquery.custom-file

var ENTRY = (function($) {
    var app = {}, $el, $et = $('#entry_title'), evts = 'keyup unfocus blur update', stops = null;
    // Public functions
    // Private functions
    function init() {
        $('#entry_attachment').customFile({ element:'span', status:true, text: 'Choose Attachment' });
        $('#entry_url, #entry_title').on(evts, suggest);
        stops = _.union(APP.STOPS, $('#entry_tag_list').val().split(', '));
        $('.icon-leaf').click(generate);
    }
    function generate(e) {
        var nums = '0123456789',
        lowers = 'abcdefghijklmnopqrstuvwxyz',
        uppers = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        others = '~!@#$%^&*()-_=+[{]}\\|<>/? ',
        chars = [rando(nums), rando(lowers), rando(uppers), rando(others), rando(nums), rando(lowers), rando(uppers), rando(others), rando(uppers), rando(others)];
        $('#entry_password').val(_.shuffle(chars).join(''));
    }
    function rando(str) {
        var num = Math.floor(Math.random() * str.length);
		    return str.substring(num, num + 1);
		}
    function suggest() {
        var suggestions = $('#entry_url').val().split('http://').join('').split('https://').join('').split('.');
        suggestions.push($et.val());
        //sugesstions = _.union(suggestions, $et.val().split(' '));
        suggestions = _.difference(suggestions, stops);
        suggestions = _.reject(suggestions, function(val){ return val.length < 3; });
        //console.log('suggest', _.uniq(suggestions));
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));

