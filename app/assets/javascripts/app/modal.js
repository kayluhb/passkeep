;(function($, undefined) {

  var $overlay = null,
      $modal = null,

      CANCEL_SELECTOR = '.cancel',
      CLICK_EVT = 'click',
      KEY_EVT = 'keyup',
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

    $modal = $($(e.currentTarget).data('modal'));

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
