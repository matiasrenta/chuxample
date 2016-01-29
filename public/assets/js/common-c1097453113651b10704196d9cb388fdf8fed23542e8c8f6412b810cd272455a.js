(function() {
  var square;

  square = function() {
    return $('table').DataTable({
      autoWidth: false,
      info: false,
      searching: false,
      ordering: false,
      paging: false,
      responsive: {
        details: {
          renderer: function(api, rowIdx) {
            var data;
            data = (api.cells(rowIdx, ':hidden')).eq(0).map(function(cell) {
              var header;
              header = $((api.column(cell.column)).header());
              return "<p>" + (header.text()) + ": " + ((api.cell(cell)).data()) + "</p>";
            }).toArray().join('');
            false;
            if (data != null) {
              return $('<table/>').append(data);
            } else {
              return false;
            }
          }
        }
      }
    });
  };

  setTimeout(square, 100);

}).call(this);
