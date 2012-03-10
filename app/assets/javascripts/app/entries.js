var ENTRIES = (function($) {
    var app = {}, $el, tmpl, on = 'on', dur = 250;
    // Public functions
    // Private functions
    function init() {
        $('.index > li > a').live('click', onEntryClick);
        tmpl = _.template($('#entry-template').html());
    }
    function onCloseClick(e) {
        e.preventDefault();
        
        $el = $(e.currentTarget).closest('li');
        $el.removeClass(on);
        var $a = $el.find('a');
        $el.find('.deets').slideUp(dur, function(){
            $(this).remove();
            $a.delay(100).fadeTo(dur, 1);
        });
    }
    function onEntryClick(e) {
        e.preventDefault();
        
        $el = $(e.currentTarget);
        window.location = '#!' + $el.attr('href');
        $.ajax({ type:"GET", url: $el.attr('href') + ".json" })
            .success(onEntry);
    }
    function onEntry(r) {
        $el = $('#' + r.id);
        $el.find('a').hide().css({ opacity:0 });;
        $el.addClass('on');
        r.path = $el.find('a').attr('href');
        var $t = $(tmpl(r));
        $t.hide();
        $el.append($t);
        $t.slideDown();
        $t.find('.close').click(onCloseClick);
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));

