//= require jquery_ujs
//= require ../libs/bootstrap
//= require ../libs/underscore-min
//= require ../libs/chosen.jquery.min
//= require ../libs/jquery-ui-1.8.17.custom.min
//= require ../libs/jquery.hotkeys
//= require ./team-list

// usage: log('inside coolFunc', this, arguments);
window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};

(function(a){function b(){}for(var c="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(","),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());

var APP = (function($) {
    var app = {
        STOPS: ['about', 'are', 'com', 'for', 'from', 'how', 'htt', 'http', 'https', 'org', 'that', 'the', 'this', 'was', 'what', 'when', 'where', 'who', 'will', 'with', 'the', 'www']
    }, $el, $win = $(window), $search = $('#search'), $fixed = $('.navbar'), on = 'on';
    // Public functions
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
        $(document).bind('keydown', 'shift+l', onSearchFocus);
        $(window)
            .on('scroll', scrollsies)
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
    function onSearchFocus() {
        $search.focus();
        $search.val('');
        return false;
    }
    function onSearchSelect(e, ui) {
        window.location = ui.item.path;
    }
    function scrollsies() {
        if ($win.scrollTop() > 200) {
            $fixed.addClass(on);
        } else {
            $fixed.removeClass(on);
        }
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));
