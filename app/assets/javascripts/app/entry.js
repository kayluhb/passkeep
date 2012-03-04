//= require ../libs/jquery.custom-file

var ENTRY = (function($) {
    var app = {}, $el,
    $et = $('#entry_title'), $suggestions = $('#suggestions'), $suggestList = $('#suggestion-list'), $tagList = $('#entry_tag_list'),
    evts = 'keyup unfocus blur update', stops = null;
    // Public functions
    // Private functions
    function init() {
        $('#entry_attachment').customFile({ element:'span', status:true, text: 'Choose Attachment' });
        $('#entry_url, #entry_title').on(evts, suggest);
        stops = _.union(APP.STOPS, $tagList.val().split(', '));
        $('.icon-leaf').click(generate);
        $('#suggestion-list .tag').live('click', onTagClick);
        suggest();
    }
    function generate(e) {
        var nums = '0123456789',
        lowers = 'abcdefghijklmnopqrstuvwxyz',
        uppers = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        others = '~!@#$%^&*()-_=+[{]}\\|<>/? ',
        chars = [rando(nums),
                 rando(lowers),
                 rando(uppers),
                 rando(others),
                 rando(nums),
                 rando(lowers),
                 rando(uppers),
                 rando(others),
                 rando(uppers),
                 rando(others),
                 rando(lowers),
                 rando(uppers),
                 rando(others),
                 rando(uppers),
                 rando(others)];
        $('#entry_password').val(_.shuffle(chars).join(''));
    }
    function rando(str) {
        var idx = Math.floor(Math.random() * str.length);
        return str.substring(idx, idx + 1);
    }
    function suggest() {
        var suggestions = $('#entry_url').val().split('http://').join('').split('https://').join('').split('.');
        suggestions.push($et.val());
        suggestions = _.difference(suggestions, stops);
        suggestions = _.reject(suggestions, function(val){ return val.length < 3; });
        suggestions = _.uniq(suggestions);
        if (suggestions.length > 0) {
            suggestions = _.map(suggestions, function(suggest){ return '<a href="javascript:;" class="tag">' + suggest + '</a>'; });
            $suggestList.html(suggestions.join(', '));
            $suggestions.show();
        } else {
            $suggestions.hide();
        }
    }
    function onTagClick(e) {
        $el = $(e.currentTarget);
        var tags = $tagList.val();
        $tagList.val(tags + (tags !== '' ? ', ' : '') + $el.text());
        stops = _.union(APP.STOPS, $tagList.val().split(', '));
        suggest();
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));

