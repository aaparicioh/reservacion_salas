$(document).ready(function() {
    $('#calendarA4P').fullCalendar({

      header: {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
      },
      selectable: true,
      selectHelper: true,
      editable: false,
      navLinks: true,
      eventLimit: true,
      weekends : false,
      fixedWeekCount: false,
      
      events:[

              {
            title  : 'event1',
            start  : '2018-01-01'
        },
        {
            title  : 'event2',
            start  : '2018-01-05',
            end    : '2018-01-07'
        },
        {
            title  : 'event3',
            start  : '2018-01-09T12:30:00',
            allDay : false // will make the time show
        },
        {
          start: '2018-02-05',
          overlap: false,
          rendering: 'background',
          color: '#ff9f89'
        }

 

              ]

  })
});
