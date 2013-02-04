/* 
Call the teamList with $('jquery-selector').teamList({ url:'the-search-url' });
*/

(function($) {
    var TeamList = function(el, opts) {
        //Defaults are below
        var settings = $.extend({}, $.fn.teamList.defaults, opts);
        var $el,
            $search,
            $list,
            $tokens;

        // private methods
        function init() {
            $el = $(el);
            $list = $el.find('ul');
            $tokens = $el.find('input:hidden');
            $search = $el.find('input[type=search]');
            $search.autocomplete({ select:onSelect, source:settings.url });
            $el.find('.close').live('click', onRemove);
        }

        function serialize() {
            ids = [];
            $list.find('li').each(function(idx, el){
                ids[ids.length] = $(el).data('id');
            });
            $tokens.val(ids.join(','));
        }

        function onRemove(e) {
            var targ = $(e.currentTarget).parent(),
            poof = $('<div class="poof"/>');
            poof.css({ left:e.pageX - targ.width() * 0.5, top:e.pageY - targ.height() * 0.5 });
            $('body').append(poof);
            requestTimeout(function(){ poof.remove(); }, 1000);
            targ.fadeTo(200, 0).slideUp(200, function(){ onRemoveComplete(targ, poof); });
        }

        function onRemoveComplete(targ, poof) {
            targ.remove();
            serialize();
        }
        
        function onSelect(e, ui) {
            var li = $('<li data-id="' + ui.item.id + '"><a class="close" title="remove">&times;</a> ' + ui.item.name + '</li>');
            li.hide();
            $list.append(li);
            li.slideUp(0).slideDown(200);
            serialize();
        }
        init();
    };
    $.fn.teamList = function(options) {
        return this.each(function(idx, el) {
            var $el = $(this), key = 'teamList';
            // Return early if this element already has a plugin instance
            if ($el.data(key)) { return; }
            // Pass options to plugin constructor
            var teamList = new TeamList(this, options);
            // Store plugin object in this element's data
            $el.data(key, teamList);
        });
    };
    // default settings
    $.fn.teamList.defaults = { url:'' };
})(jQuery);