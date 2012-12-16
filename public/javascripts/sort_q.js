
// Sorting the list

jQuery(function() {
  return $('#questions').sortable({
    axis: 'y',
    handle: '.handle',
    dropOnEmpty: false,
    cursor: 'crosshair',
    opacity: 0.4,
    scroll: true,
    update: function() {
      return $.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });
});
