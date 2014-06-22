//= require ../libs/underscore-min

;(function($, undefined) {
  'use strict';

  function init() {
    $(document).on('page:change', initPage);
  }

  function initPage() {
    $('#generate-password')
      .off('click', generatePassword)
      .on('click', generatePassword);

    $('#password-generator input[type="checkbox"]')
      .off('change', generatePassword)
      .on('change', generatePassword);

    $('#password-length')
      .off('blur', generatePassword)
      .on('blur', generatePassword);
  }

  function addChars(chars) {
    var nums = '0123456789',
        lowers = 'abcdefghijklmnopqrstuvwxyz',
        uppers = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ',
        others = '~!@#$%^&*()-_=+[{]}\\|<>/? ';

    if ($('#password-special').is(':checked')) {
      chars.push(others.split(''));
    }

    if ($('#password-numbers').is(':checked')) {
      chars.push(nums.split(''));
    }

    if ($('#password-lowercase').is(':checked')) {
      chars.push(lowers.split(''));
    }

    if ($('#password-uppercase').is(':checked')) {
      chars.push(uppers.split(''));
    }

    if (chars.length === 0) {
      alert('you have to select something...');
      return;
    }

    return _.flatten(chars);
  }

  function generatePassword(e) {
    var chars = addChars([]),
        idx = $('#password-length').val();

    $('#password-generator .fields').show();

    while (chars.length < idx) {
      chars = addChars(chars);
    }

    chars = _.sample(chars, idx);

    $('#entry_password').val(chars.join(''));
  }

  $(init);
} (jQuery));
