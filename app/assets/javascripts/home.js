$(document).ready(function(){
  var recipient_url = '/commerce/checkout_review/select_care_recipient.js';
  var location_url = '/commerce/checkout_review/select_care_location.js';
  var note_url = '/commerce/save_note';

  var dates = $('#appointment_dates');
  var calendar = $('#checkout-calendar');

  var bindCartItem = function() {
    var wrapper = $(this);
    var who = $('.who', wrapper);
    var where = $('.where', wrapper);
    var appointment_id = wrapper.attr('rel');

    var who_Change = function() {
      var data = {
        appointment_id: appointment_id,
        recipient_id: who.val()
      };

      $.post(recipient_url, data);
    };

    var where_Change = function() {
      var data = {
        appointment_id: appointment_id,
        location_id: where.val(),
        recipient_id: who.val()
      };
      $.post(location_url, data, updateBindings);
    };

    if (who.length > 0) {
      who.change(who_Change);
    }
    if (where.length > 0) {
      where.change(where_Change);
    }

    wrapper.addClass('processed');
  };

  var bindDetail = function() {
    var wrapper = $(this);
    var id = wrapper.attr('rel');
    var textarea = $('textarea', wrapper);
    var detailsText = $('.details-text', wrapper);
    var detailsEditBlock = $('.detailsbloc', wrapper);
    var mode = "view";
    var detailLink = $('.detail-link', wrapper);
    var saveLink = $('.save-link', wrapper);
    var cancelLink = $('.cancel-link', wrapper);

    var originalDetails = $.trim(detailsText.text());
    var currentDetails = "";

    var toViewMode = function() {
      detailsText.show().text(currentDetails);
      detailsEditBlock.hide();
      detailLink.show();
      mode = "view";
    };

    var toEditMode = function() {
      detailsText.hide();
      detailsEditBlock.show();
      detailLink.hide();
      mode = "edit";
    };

    var toggleMode = function() {
      if (mode == "edit") toViewMode();
      else toEditMode();
    }


    var detail_Click = function() {
      toggleMode();
    };

    var detail_Cancel = function() {
      currentDetails = originalDetails;
      textarea.val(currentDetails);
      toViewMode();
    };

    var detail_SaveComplete = function(data) {
      originalDetails = currentDetails;
      toViewMode();
    };

    var detail_Save = function() {
      currentDetails = textarea.val();

      var data = {
        shift_token: id,
        note: currentDetails
      };

      $.post( note_url, data, detail_SaveComplete);
    };

    detailLink.click(detail_Click);
    saveLink.click(detail_Save);
    cancelLink.click(detail_Cancel);

  }

  var updateBindings = function() {
    $('.infopanel .replaceable .appointment').each(bindCartItem);
    $('.appointment-wrapper').each(bindDetail);
  };

  var initialize = function(){
    var dateSelect = function() {
      return [false];
    }

    if (calendar.length > 0) {

      var addDatesArray;

      if (dates.length > 0) {
        addDatesArray = dates.val().split(',')

      } else {
        addDatesArray = [];
      }

      calendar.multiDatesPicker({
        numberOfMonths: 1,
        minDate:new Date(),
        dateFormat: "yy-mm-dd",
        defaultDate: addDatesArray[0],
        dayNamesMin: ['S', 'M', 'T', 'W', 'T', 'F', 'S'],
        addDates: addDatesArray,
        onSelect: dateSelect,
        beforeShowDay: dateSelect,
        beforeShow: function(i) {
          return false;
        }
      });

      $('td', calendar).addClass('ui-datepicker-unselectable');
    }

    $('body').bind('ajaxComplete', function() {
      updateBindings();
    });

    updateBindings();
  };



  initialize();

});
