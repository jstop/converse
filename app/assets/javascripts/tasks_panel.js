$(document).on('turbolinks:load', function() {

/// TimeLeftToday

  var $timeLeftTodayContainer = $('#timeLeftToday');
  var timePolling;
  var bedHour = 23;
  var bedMinute = 0;

  if ($timeLeftTodayContainer.length) {
    setTimeLeftToday();
    timePolling = setInterval(setTimeLeftToday, 10000);
    $(document).on('turbolinks:load', clearPolling);
  }

  function clearPolling() {
    clearInterval(timePolling);
    $(document).off('turbolinks:load', clearPolling);
  }

  function setTimeLeftToday() {
    minutesToBed = minutesTill(bedHour,bedMinute);
    document.getElementById('timeLeftToday').innerHTML = formattedTime(minutesToBed);;

    $.getJSON("/tasks.json",
      { today: true },
      function(tasks) {
        setTaskTime(tasks, minutesToBed);
      }
    );
  }


/// Tasks

  function setTaskTime(tasks, minutesToBed) {

    var workLeft = 0;
    for (i = 0, len = tasks.length; i < len; i++) {
      workLeft += tasks[i]["duration"];
    }
    document.getElementById('tasksTime').innerHTML = formattedTime(workLeft);


    //var freeTimeLeftToday = moment().to(moment("23:00:00",'hh:mm:ss').subtract(workLeft, "minutes"), true);

    document.getElementById('freeTimeClock').innerHTML = formattedTime(minutesToBed - workLeft)
    
  }
  
  // Returns number fo minute between now and the hour and minut of the same day passed to the parameters
  function minutesTill(hour, minute) {
    /// Time Left Until Bed
    var d = new Date();
    var b = new Date();
    b.setHours(hour,minute,0);
    return ( (b.getTime() - d.getTime())/60000 );
  }

  function formattedTime(minutes) {
		var time ="";
		if (minutes >= 60){
		  time += Math.floor(minutes/60);
		  if (minutes >= 120){ 
		    time += " hours";
			} else {
		    time += " hour";
			}
		}
		if ((minutes%60) != 0) {
			time += " "; 
			time += (Math.floor(minutes%60));
      time +=" minutes" 
		}
    return time;
	}
});
