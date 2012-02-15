var ENTRIES = (function($) {
    var app = {}, $el, tmpl, on = 'on';
    // Public functions
    // Private functions
    function init() {
        $('.index > li > a').click(onEntryClick);
        tmpl = _.template($('#entry-template').html());
    }
    function onCloseClick(e) {
        alert('foo')
        //e.preventDefault();
        
        $el = $(e.currentTarget);
        console.log($el);
        $el.closest('li').find('a').show();
        $el.parent().remove();
    }
    function onEntryClick(e) {
        e.preventDefault();
        
        $el = $(e.currentTarget);
        window.location = '#!' + $el.attr('href');
        $.ajax({ type:"GET", url: $el.attr('href') + ".json" })
            .success(onEntry);
    }
    function onEntry(r) {
        //console.log(r);
        $el = $('#' + r.id);
        $el.find('a').hide();
        $el.addClass('on');
        r.path = $el.find('a').attr('href');
        var deets = tmpl(r);
        $el.append(deets);
        $el = $(deets).find('.close');
        $el.on('click', onCloseClick);
        console.log($el)
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));