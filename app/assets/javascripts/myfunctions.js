$(document).on('turbolinks:load', function() {

/// TimeLeftToday

  var $timeLeftTodayContainer = $('#timeLeftToday');
  var bedTimePolling;

  if ($timeLeftTodayContainer.length) {
    setTimeLeftToday();
    bedTimePolling = setInterval(setTimeLeftToday, 10000);
    $(document).on('turbolinks:load', clearPolling);
  }

  function clearPolling() {
    clearInterval(bedTimePolling);
    $(document).off('turbolinks:load', clearPolling);
  }

  function setTimeLeftToday() {
    var timeLeftToday = moment().to(moment("23:00",'hh:mm'), true);
    document.getElementById('timeLeftToday').innerHTML = timeLeftToday;

    $.getJSON("/tasks.json",
      { today: true },
      function(tasks) {
        setTaskTime(tasks);
      }
    );
  }


/// Tasks


  function setTaskTime(tasks) {
    var workLeft = 0;
    for (i = 0, len = tasks.length; i < len; i++) {
      workLeft += tasks[i]["duration"];
    }
    document.getElementById('tasksTime').innerHTML = Math.floor(workLeft/60) + " hour " + (workLeft%60) + " minutes";
    var freeTimeLeftToday = moment().to(moment("23:00:00",'hh:mm:ss').subtract(workLeft, "minutes"), true);
    document.getElementById('freeTimeClock').innerHTML = freeTimeLeftToday
    
  }





});
