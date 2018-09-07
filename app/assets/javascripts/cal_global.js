$(document).ready(function() {
  /*$('#printpdf').click(function(){
      window.print();
  });*/
    $('#calendarglobal').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      weekends: false,
      height : 750,
      width  : 300,
      fixedWeekCount: false,

      eventColor: 'green',
      textColor: '#FFF',

      events: '/reservacions.json',

      /*eventRender: function(event, element) {
        element.qtip({
          content: event.description
        });
      }*/
    });
});