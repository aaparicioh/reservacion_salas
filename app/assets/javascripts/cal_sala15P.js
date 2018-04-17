$(document).ready(function() {
    $('#calendar15P').fullCalendar({
      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      weekends: false,
      height : 750,
      width  : 300,

      eventColor: 'green',
      textColor: '#FFF',

      events: '/reservacions.json'

      /*events:[
        {
          "title"  : "event1",
          "start"  : "2018-04-23",
          description: 'Evento importante'
        },
        {
          title  : 'event2',
          start  : '2018-05-02',
          end    : '2018-05-04',
          description: 'Evento importante'
        },
        {
          title  : 'event3',
          start  : '2018-05-09T12:30:00',
          end    : '2018-05-09T15:30:00',
          allDay : false // will make the time show
        },
        {
          title  : '3er Coloquio: las neurociencias',
          start  : '2018-04-24T16:00:00',
          allDay : false // will make the time show
        },
        {
          start: '2018-04-18',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89',
          description: 'Evento importante'
        }
      ],*/
      /*eventAfterAllRender: function() {
        element.qtip({
          content: event.description
        });
      }*/
      //backgroundColor: '#f00'.
    });
});