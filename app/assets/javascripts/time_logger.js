// Request a log every hour
setInterval(requestLog, 3600000);
function requestLog(){
  $('a[href$="/time_logs/new"]').click();
};
