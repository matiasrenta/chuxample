(function() {
  jQuery(function($) {
    var $body, formatResult, formatSelection, itemResultCssClass, itemSelectionCssClass;
    itemResultCssClass = function(item) {
      var cssClass;
      cssClass = '';
      if (item.class_name !== void 0) {
        cssClass = item.class_name;
      }
      return cssClass;
    };
    itemSelectionCssClass = function(item) {
      var cssClass;
      cssClass = '';
      if (item !== null && item.selection_class_name !== void 0) {
        cssClass = item.selection_class_name;
      } else if (item !== null) {
        cssClass = itemResultCssClass(item);
      }
      return cssClass;
    };
    formatResult = function(item) {
      var classes, result;
      result = item.text;
      if (item.class_name !== void 0) {
        classes = item.class_name.split(' ');
        classes = classes.map(function(origClass) {
          return 'in-' + origClass;
        });
        result = '<span class="' + classes.join(' ') + '">' + item.text + '</span>';
      }
      return result;
    };
    formatSelection = function(item) {
      var classes, result;
      result = item.text;
      classes = item.selection_class_name;
      if (classes === void 0) {
        classes = item.class_name;
      }
      if (classes !== void 0) {
        classes = classes.split(' ');
        result = '<span class="' + classes.join(' ') + '">' + item.text + '</span>';
      }
      return result;
    };
    window.initAutoAjaxSelect2 = function() {
      var $inputs;
      $inputs = $('input.auto-ajax-select2').not('.select2-offscreen');
      $inputs.each(function() {
        var $input, customFormatResult, customFormatSelection, formatResultFunc, formatSelectionFunc, limit, path, s2DefaultOptions, s2FullOptions, s2UserOptions;
        $input = $(this);
        path = $input.data('s2-href');
        limit = $input.data('s2-limit') || 25;
        customFormatSelection = $input.data('s2-format-selection');
        customFormatResult = $input.data('s2-format-result');
        if (customFormatSelection !== undefined && (window[customFormatSelection] !== undefined)) {
          formatSelectionFunc = window[customFormatSelection];
        } else {
          formatSelectionFunc = formatSelection;
        }
        if ((customFormatResult !== undefined) && (window[customFormatResult] !== undefined)) {
          formatResultFunc = window[customFormatResult];
        } else {
          formatResultFunc = formatResult;
        }
        s2DefaultOptions = {
          allowClear: true,
          multiple: false,
          formatSelection: formatSelectionFunc,
          formatResult: formatResultFunc,
          formatResultCssClass: itemResultCssClass,
          ajax: {
            url: path,
            dataType: 'json',
            data: function(term, page) {
              var $this, additionalAjaxData, additionalUserData, ajaxData, functionCollection, paramsCollection;
              ajaxData = {
                term: term,
                page: page
              };
              $this = $(this.context);
              additionalUserData = $this.data('s2-options');
              paramsCollection = {};
              if (additionalUserData !== undefined) {
                additionalAjaxData = additionalUserData['additional_ajax_data'];
                if (additionalAjaxData !== undefined) {
                  if (typeof window[additionalAjaxData['function']] === "function") {
                    functionCollection = window[additionalAjaxData['function']]($input, term);
                  }
                  $(additionalAjaxData['selector']).each(function(index, el) {
                    var $el;
                    $el = $(el);
                    paramsCollection[$el.attr('name')] = $el.val();
                  });
                  $.extend(paramsCollection, additionalAjaxData['params'], functionCollection);
                  delete paramsCollection[$this.attr('name')];
                }
              }
              return $.extend({}, paramsCollection, ajaxData);
            },
            results: function(data, page) {
              var more;
              more = (page * limit) < data.total;
              return {
                results: data.items,
                more: more
              };
            }
          },
          initSelection: function(element, callback) {
            var $element, id, initClassName, initSelectionClassName, initText, params;
            $element = $(element);
            id = $element.val();
            initText = $element.data('init-text');
            initClassName = $element.data('init-class-name');
            initSelectionClassName = $element.data('init-selection-class-name');
            if (id !== '') {
              if (initText !== void 0) {
                params = {
                  id: id,
                  text: initText
                };
                if (initClassName !== void 0) {
                  params.class_name = initClassName;
                  params.selection_class_name = initSelectionClassName;
                }
                return callback(params);
              } else {
                return $.ajax(path, {
                  data: {
                    init: true,
                    item_ids: id
                  },
                  dataType: "json"
                }).done(function(data) {
                  if (data !== null) {
                    return callback(data);
                  } else {
                    $element.val('');
                    return callback({
                      id: '',
                      text: ''
                    });
                  }
                });
              }
            }
          }
        };
        s2UserOptions = $input.data("s2-options");
        if (s2UserOptions === undefined) {
          s2FullOptions = $.extend({}, s2DefaultOptions);
        } else {
          s2FullOptions = $.extend({}, s2DefaultOptions, s2UserOptions);
        }
        $input.select2(s2FullOptions);
      });
    };
    initAutoAjaxSelect2();
    $body = $('body');
    $body.on('ajaxSuccess', function() {
      initAutoAjaxSelect2();
    });
    $body.on('cocoon:after-insert', function() {
      initAutoAjaxSelect2();
    });
  });

}).call(this);
