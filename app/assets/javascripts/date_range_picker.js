var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
        timePicker: true,
        timePickerIncrement: 30,
        alwaysShowCalendars: true,
        locale: {
          format: 'YYYY-MM-DD HH:mm'
        }
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
  })
};
$(document).on('turbolinks:load', date_range_picker);

var date_picker;
date_picker = function() {
  $('.date-picker').each(function(){
    $(this).daterangepicker({
      timePicker: true,
      singleDatePicker: true,
      showDropdowns: false,
      minYear: parseInt(moment().format('YYYY'),10) + 5,
      maxYear: parseInt(moment().format('YYYY'),10)+10,
      locale: {
        format: 'MMM DD hh:mm'
      }
  }, function(start, end, label) {
      $('.task-deadline-hidden').val(start.format('YYYY-MM-DD HH:mm'));
    });
  })
};

$(document).on('turbolinks:load', date_picker);
