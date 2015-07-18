// init tables
//$('table').DataTable({paging:false,searching:false,info:false,ordering:false});

$('table').dataTable({
  autoWidth: false,
  paging: false,
  searching: false,
  info: false,
  ordering: false,
  preDrawCallback: function () {
    // Initialize the responsive datatables helper once.
    if (!responsiveHelper) {
      responsiveHelper = new ResponsiveDatatablesHelper(tableElement, breakpointDefinition);
    }
  },
  rowCallback    : function (nRow) {
    responsiveHelper.createExpandIcon(nRow);
  },
  drawCallback   : function (oSettings) {
    responsiveHelper.respond();
  }
});
