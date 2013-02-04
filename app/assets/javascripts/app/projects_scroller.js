var SCROLLER = (function($) {
    var app = {},
        $doc = $(document),
        $list = $('ul.index'),
        $win = $(window),
        buffer = 100,
        page = parseInt(getURLParameter('page'),10)||1,
        complete = false,
        loading = false,
        evt = 'scroll.SCROLLER',
        on = 'on',
        url = '/projects/paginate.json',
        tmpl = null,
        data = {};
    
    function init() {
        tmpl = _.template($('#list-template').html());
        $win
            .on(evt, scrollsies)
            .trigger(evt);
    }

    function isNearBottom(){
        return $win.scrollTop() > $doc.height() - $win.height() - buffer;
    }

    function scrollsies() {
        if (!isNearBottom() || loading || complete) { return; }
        loading = true;
        ++page;
        window.location = '#!/page/' + page;
        data.idx = page * 30;
        $.ajax({ url:url, data:data })
            .success(onReturn);
    }

    function getURLParameter(name) {
        return decodeURI(
            (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[null])[1]
        );
    }

    function onReturn(r) {
        complete = r.length === 0;
        if (complete) { return; }
        var item;
        _.each(r, function(el){ $list.append(tmpl(el)); });
        loading = false;
        item = null;
        return false;
    }
    $(init);
    return app;
} (jQuery));