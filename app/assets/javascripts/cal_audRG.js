

$(document).ready(function() {
    $('#calendarARG').fullCalendar({

                        header:  {
        left: 'prev,next today',
        center: 'title',
        right: 'month,agendaWeek,agendaDay'
        },
    
        height : 750,
        width  : 300,
        weekends : false,
        selectable: true,
        fixedWeekCount: false,
        loading: function(bool){
              if (bool) 
                  $('#loading').show();
              else 
                  $('#loading').hide();
          },
        events:"/reservacions/get_reservacion",
        
        dragOpacity: "0.5",
        eventDrop: function(reservacion, dayDelta, minuteDelta, allDay, revertFunc){
                  moveEvent(reservacion, dayDelta, minuteDelta, allDay);
          },

        eventResize: function(reservacion, dayDelta, minuteDelta, revertFunc){
                  resizeEvent(reservacion, dayDelta, minuteDelta);
          }
  
    });
});