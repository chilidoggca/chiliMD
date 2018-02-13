document.addEventListener("DOMContentLoaded", function() {
  // function eventsjson () {
  //   return fetch(`/users/7/events.json`,{})
  //   .then(res => res.json())
  // }
  // const events = eventsjson();
  // events;
  // console.log(events);
  $('#reviewcalendar').fullCalendar({
    // events: events,
    events: '/users/7/events.json',
    eventColor: '#378006',
    allDayDefault: true,
    defaultView: 'month',
    header: {
      left: 'today prev,next',
      center: 'title',
      right: 'agendaDay,agendaWeek,month',
      },
  });
  $('#showreviewcalendar .btn-primary').on('click', ()=> {
    $('#reviewcalendar').toggleClass('hidecalendar');
    $('#reviewcalendar').fullCalendar('render');
  });
});
