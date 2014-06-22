;(function($, undefined) {

  var $overlay = null,
      $modal = null,

      CANCEL_SELECTOR = '.cancel',
      CLICK_EVT = 'click',
      KEY_EVT = 'keyup',
      MIN_WIDTH = 400,
      OVERLAY_SELECTOR = '.md-overlay',
      SHOW_CLASS = 'md-show';

  function init() {
    $(document).on('page:change', initPage);
  }

  function initPage() {
    $overlay = $(OVERLAY_SELECTOR);

    $('a[data-modal]')
      .off(CLICK_EVT, open)
      .on(CLICK_EVT, open);
  }

  function onKeyUp(e) {
    if (e.keyCode == 27) {
      removeModal();
    }
  }

  function open(e) {
    var metaClick = e.metaKey || e.ctrlKey;

    if (metaClick || $(window).width() < MIN_WIDTH) {
      return true;
    }

    e.preventDefault();

    $modal = $($(e.currentTarget).data('modal'));

    $modal.find('.body').css({ maxHeight: $(window).height() - 200 });

    $overlay
      .off(CLICK_EVT, removeModal)
      .on(CLICK_EVT, removeModal);

    $modal
      .find(CANCEL_SELECTOR)
        .off(CLICK_EVT, cancelModal)
        .on(CLICK_EVT, cancelModal);

    $modal.addClass(SHOW_CLASS);

    $(document)
      .off(KEY_EVT, onKeyUp)
      .on(KEY_EVT, onKeyUp);
  }

  function cancelModal(e) {
    e.preventDefault();
    removeModal();
  }

  function removeModal() {
    $(document).off(KEY_EVT, onKeyUp);
    $modal.removeClass(SHOW_CLASS);
    $modal = null;
  }

  init();

})(jQuery);
