//= require jquery_ujs
//= require ../libs/bootstrap
//= require ../libs/underscore-min
//= require ../libs/chosen.jquery.min
//= require ../libs/jquery-ui-1.8.17.custom.min
//= require ../libs/jquery.hotkeys
//= require ../libs/request-interval
//= require ./team-list

// usage: log('inside coolFunc', this, arguments);
window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};

(function(a){function b(){}for(var c="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());

var APP = (function($) {
    var app = {
            STOPS: ['about', 'are', 'com', 'for', 'from', 'how', 'htt', 'http',
            'https', 'org', 'that', 'the', 'this', 'was', 'what', 'when',
            'where', 'who', 'will', 'with', 'the', 'www']
        },
        $el,
        $dom = $(document),
        $win = $(window),
        $search = $('#search'),
        $fixed = $('.navbar,#content'),
        on = 'on';

    // Public functions
    app.clippy = function(id, param, value) {
        value = encodeURI(value);
        return '<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" width="110" height="14" id="clippy-' + param + '-' + id +
        '" ><param name="movie" value="/assets/clippy.swf"/><param name="allowScriptAccess" value="always" /><param name="quality" value="high" /><param name="scale" value="noscale" /><param name="FlashVars" value="text=' +
        value + '"><param name="bgcolor" value="#F5F5F5"><embed src="/assets/clippy.swf" width="110" height="14" name="clippy-' + param + '-' + id +
        '" quality="high" allowScriptAccess="always" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" FlashVars="text=' + value +
        '" bgcolor="#F5F5F5" /></object>';
    };

    app.externalLink = function(link) {
        if (link.indexOf('http') < 0) { link = 'http://' + link; }
        return '<a href="' + link + '" target="_blank">' + link.split('http://').join('').split('https://').join('') + '</a>';
    };

    // Private functions
    function init() {
        $('a[href=#]').attr('href', 'javascript:;');

        $("a[href^=http]").click(open);

        // Set up the global ajax
        $.ajaxSetup({ cache: false, error: function errorLog(x, e) { log(x, e); }, type: 'POST' });

        $("select.chosen").chosen({ no_results_text: "No results matched" });

        if (!Modernizr.input.placeholder) { placeholder(); }

        $.ui.autocomplete.prototype._renderItem = function(ul, item) {
            var re = new RegExp("^" + this.term, "gm"),
            t = item.name.replace(re, '<span class="highlight">' + this.term + '</span>');
            return $('<li></li>')
                .data('item.autocomplete', item)
                .append('<a>' + t + '</a>')
                .appendTo(ul);
        };
        $search.autocomplete({ select:onSearchSelect, source:'/search' });
        
        $('a[rel=tooltip]').tooltip({
            placement:'bottom'
        });
        $dom
            //.bind('keydown', 'shift+a', onAddEntry)
            //.bind('keydown', 'shift+b', onBucket)
            .bind('keydown', 'shift+l', onSearchFocus);
            //.bind('keydown', 'shift+t', onTeams);
        $(window)
            .on('scroll', scrollsies);
    }
    function open(e) {
        e.preventDefault();
        var href = this.getAttribute("href");
        if (window.location.host !== href.split('/')[2]) {
            window.open(href);
        } else {
            window.location = href;
        }
    }
    function placeholder() {
        var attr = 'placeholder';
        $('input[' + attr + '!=""]').each(function(idx, el){
            $el = $(el);
            var d = $el.attr(attr);
            if (d === undefined) { return; }
            $el.focus(function onFocus() {
                if (this.value === d) { this.value = ''; }
            }).blur(function onBlur() {
                if ($.trim(this.value) === '') { this.value = d; }
            });
            $el.blur();
        });
    }
    function locate(p) {
        if (window.location.pathname !== p) { window.location = p; }
    }
    function onAddEntry() {
        locate('/entries/new');
    }
    function onBucket() {
        locate('/');
    }
    function onTeams() {
        locate('/teams');
    }
    function onSearchFocus() {
        $search.focus();
        $search.val('');
        return false;
    }
    function onSearchSelect(e, ui) {
        window.location = ui.item.path;
    }
    function scrollsies() {
        //console.log($win.scrollTop())
        if ($win.scrollTop() > 65) {
            $fixed.addClass(on);
        } else {
            $fixed.removeClass(on);
        }
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));
