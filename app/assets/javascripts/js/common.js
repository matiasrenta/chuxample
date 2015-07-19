// init tables
//$('table').DataTable({paging:false,searching:false,info:false,ordering:false});

$('table').DataTable({
  autoWidth: false,
  paging: false,
  searching: false,
  info: false,
  ordering: false,
  responsive: {
    details: {
      type: 'inline'
    }
  }
});
