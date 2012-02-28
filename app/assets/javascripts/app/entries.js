var ENTRIES = (function($) {
    var app = {}, $el, tmpl, on = 'on';
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
        $el.find('a').show();
        $el.find('.deets').remove();
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
        $el.find('a').hide();
        $el.addClass('on');
        r.path = $el.find('a').attr('href');
        $el.append(tmpl(r));
        $('.close').click(onCloseClick);
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));

