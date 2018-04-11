$(document).ready(function() {
    $('#calendar').fullCalendar({
      header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
      },
      weekends: false,
      height : 750,
      width  : 300,

      events: '/reservacions.json',

      /*events:[
        {
          "title"  : "event1",
          "start"  : "2018-03-22"
        },
        {
          title  : 'event2',
          start  : '2018-01-05',
          end    : '2018-01-07'
        },
        {
          title  : 'event3',
          start  : '2018-01-09T12:30:00',
          end    : '2018-01-09T15:30:00',
          allDay : false // will make the time show
        },
        {
          title  : '3er Coloquio: las neurociencias',
          start  : '2018-01-09T16:30:00',
          allDay : false // will make the time show
        },
        {
          start: '2018-03-05',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }
      ],*/
      eventColor: '#378006',
      textColor: '#f00'
      //backgroundColor: '#f00'
      //"/reservacions/get_reservacion",

    });
});