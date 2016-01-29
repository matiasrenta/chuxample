(function() {
  jQuery(function($) {
    $(document).on('submit', 'form', function() {
      var $form;
      $form = $(this);
      $('input.auto-ajax-select2.multiple:enabled').each(function() {
        var $multi, data, i, item, len, name;
        $multi = $(this);
        data = $multi.select2('data');
        name = $multi.attr('name');
        $multi.remove();
        if (data.length === 0) {
          $form.append($('<input/>', {
            type: 'hidden',
            name: name + "[]",
            value: ''
          }));
        } else {
          for (i = 0, len = data.length; i < len; i++) {
            item = data[i];
            $form.append($('<input/>', {
              type: 'hidden',
              name: name + "[]",
              value: item.id
            }));
          }
        }
      });
    });
  });

}).call(this);
