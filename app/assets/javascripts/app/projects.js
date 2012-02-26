var PROJECTS = (function($) {
    var app = {}, $el, $tags = $('.tags'), $list = $('ul.index'),
    on = 'on', tmpl = null;
    // Public functions
    // Private functions
    function init() {
        tmpl = _.template($('#list-template').html());
        $tags.find('a').click(updateTags);
    }
    function updateTags(e) {
        e.preventDefault();
        $el = $(e.currentTarget);
        $el.toggleClass(on);
        tags = [];
        $tags.find('.' + on).each(function(idx, el){
            tags[tags.length] = $(el).parent().data('name');
        });
        console.log(TAGGED_PATH, tags);
        $list.slideUp();
        $.ajax({ url:TAGGED_PATH, data:{ tags: tags.join(',') } })
            .success(onReturn);
    }
    function onReturn(r) {
        $list.children().remove();
        _.each(r, function(el){ $list.append(tmpl(el)); });
        $list.slideDown();
    }
    // Call the init function on load
    $(init);
    return app;
} (jQuery));