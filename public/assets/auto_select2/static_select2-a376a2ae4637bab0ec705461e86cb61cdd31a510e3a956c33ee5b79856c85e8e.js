(function() {
  jQuery(function($) {
    var $body;
    window.initAutoStaticSelect2 = function() {
      $("select.auto-static-select2").not(".select2-offscreen").each(function(index, el) {
        var $el, s2DefaultOptions, s2FullOptions, s2UserOptions;
        $el = $(el);
        s2UserOptions = $el.data("s2options");
        s2DefaultOptions = {
          allowClear: true,
          width: "resolve"
        };
        if (s2UserOptions === undefined) {
          s2FullOptions = $.extend({}, s2DefaultOptions);
        } else {
          s2FullOptions = $.extend({}, s2DefaultOptions, s2UserOptions);
        }
        $el.select2(s2FullOptions);
      });
    };
    initAutoStaticSelect2();
    $body = $('body');
    $body.on('ajaxSuccess', function() {
      initAutoStaticSelect2();
    });
    $body.on('cocoon:after-insert', function() {
      initAutoStaticSelect2();
    });
  });

}).call(this);
