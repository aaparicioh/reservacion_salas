// Setup FullCalendar
$(document).ready(function() {

    /*var tooltip = $('<div/>').qtip({
        id: 'calendarPos',
        prerender: true,
        content: {
            text: ' ',
            title: {
                button: true
            }
        },
        position: {
            my: 'bottom center',
            at: 'top center',
            target: 'mouse',
            viewport: $('#calendarPos'),
            adjust: {
                mouse: false,
                scroll: false
            }
        },
        show: false,
        hide: false,
        style: 'qtip-light'
    }).qtip('api');*/

    $('#calendarPos').fullCalendar({
        //editable: true,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },

        /*eventClick: function(data, event, view) {
            var content = '<h3>'+data.title+'</h3>' +
            '<p><b>Start:</b> '+data.start+'<br />' +
            (data.end && '<p><b>End:</b> '+data.end+'</p>' || '');
            tooltip.set({
                'content.text': content
            })
            .reposition(event).show(event);
        },

        dayClick: function() { tooltip.hide() },
        eventResizeStart: function() { tooltip.hide() },
        eventDragStart: function() { tooltip.hide() },
        viewDisplay: function() { tooltip.hide() },*/

        height : 750,
        width  : 300,
        weekends: false,
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
