var initialize_popovers = function () {
  $('[data-toggle="popover"]').popover(
    {
      trigger: 'hover',
      html: true
    });
};
$(document).on('turbolinks:load', initialize_popovers);
