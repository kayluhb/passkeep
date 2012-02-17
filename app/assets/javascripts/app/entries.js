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


var SCROLLER = (function($) {
    var app = {},
    $doc = $(document),
    $list = $('ul.index'),
    $win = $(window),
    buffer = 100,
    idx = 30 * getURLParameter('page'),
    complete = false,
    loading = false,
    evt = 'scroll.SCROLLER',
    url = '/entries/paginate.json',
    tmpl = null;
    
    function init() {
        $win
            .on(evt, getPage)
            .trigger(evt);
        tmpl = _.template($('#list-template').html());
    }
    function isNearBottom(){
        return $win.scrollTop() > $doc.height() - $win.height() - buffer;
    }
    function getPage() {
        if (!isNearBottom() || loading || complete) { return; }
        loading = true;
        $.ajax({ url:url, data: { idx:idx }})
            .success(onReturn);
    }
    function getURLParameter(name) {
        return decodeURI(
            (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
        );
    }
    function onReturn(r) {
        complete = r.length === 0;
        if (complete) { return; }
        var item;
        _.each(r, function(el){ $list.append(tmpl(el)); });
        idx += r.length;
        loading = false;
        item = null;
        return false;
    }
    $(init);
    return app;
} (jQuery));
