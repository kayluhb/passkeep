var ENTRIES = (function($) {
    var app = {}, $el, tmpl, on = 'on';
    //, $tester
    // Public functions
    // Private functions
    function init() {
        $('.index > li > a').live('click', onEntryClick);
        tmpl = _.template($('#entry-template').html());
         //$tester = $('<div/>').css({ position:'absolute', top:-9999, left:-9999 });
         //$('body').append($tester);
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
        //console.log(r);
        $el = $('#' + r.id);
        $el.find('a').hide();
        $el.addClass('on');
        r.path = $el.find('a').attr('href');
        /*
        var deets = $(tmpl(r));
        $tester.append(deets);
        // console.log(deets.height());*/
        $el.append(tmpl(r));
        $('.close').click(onCloseClick);
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));

