# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->
  # Get Contestant Info
  sound = document.getElementById("audio");
  contestant1First = $("#contestant1First").attr("value");
  contestant1Last = $("#contestant1Last").attr("value");
  contestant1Email = $("#contestant1Email").attr("value");
  contestant1Cheater = $("#contestant1Cheater").attr("value");

  # Stop Watch Variables
  score1 = 0
  minutes1 = 0
  minutes2 = 0
  minutes3 = 0

  seconds1 = 0
  seconds2 = 0
  seconds3 = 0

  tens1 = 0
  tens2 = 0
  tens3 = 0


  appendTens1 = document.getElementById('tens1')
  appendTens2 = document.getElementById('tens2')
  appendTens3 = document.getElementById('tens3')

  appendSeconds1 = document.getElementById('seconds1')
  appendSeconds2 = document.getElementById('seconds2')
  appendSeconds3 = document.getElementById('seconds3')

  appendMinutes1 = document.getElementById('minutes1')
  appendMinutes2 = document.getElementById('minutes2')
  appendMinutes3 = document.getElementById('minutes3')

  buttonStop1 = document.getElementById('button-stop1')
  buttonStop2 = document.getElementById('button-stop2')
  buttonStop3 = document.getElementById('button-stop3')
  buttonReset = document.getElementById('button-reset')
  buttonStart = document.getElementById('button-start')
  submitScores = document.getElementById('button-submit')

  Interval1 = undefined
  Interval2 = undefined
  Interval3 = undefined

  submitScores.onclick = ->
    reward = 15
    cseconds1 = appendSeconds1.innerHTML
    cminutes1 = appendMinutes1.innerHTML

    if contestant1Cheater == "1"
      if cseconds1 < reward
        cminutes1 = cminutes1 - 1
        cseconds1 = 60 + ( appendSeconds1.innerHTML - 15 )
      else
        cseconds1 = appendSeconds1.innerHTML - 15
    $.ajax
      url: '/time_trials.json'
      type: 'POST'
      data: 
        'time_trial':
          'firstname': contestant1First
          'lastname': contestant1Last
          'email': contestant1Email
          'time': cminutes1 + ":" + cseconds1 + ":" + appendTens1.innerHTML
          'cheater': ("1" == contestant1Cheater)
      success: (data) ->
        location.reload();
        return
    return
       
  startTimer1 = ->
    tens1++
    if tens1 < 9
      appendTens1.innerHTML = '0' + tens1
    if tens1 > 9
      appendTens1.innerHTML = tens1
    if tens1 > 99
      console.log 'seconds'
      seconds1++
      appendSeconds1.innerHTML = '0' + seconds1
      tens1 = 0
      appendTens1.innerHTML = '0' + 0
    if seconds1 > 9
      appendSeconds1.innerHTML = seconds1
    if seconds1 > 59
      minutes1++
      appendMinutes1.innerHTML = minutes1
      seconds1 = 0
      appendSeconds1.innerHTML = '0' + 0
    return

  buttonStart.onclick = ->
    console.log 'hello'
    clearInterval Interval1
    console.log 'intervals cleared'
    Interval1 = setInterval(startTimer1, 10)
    console.log 'Intervals Set'
    return


  buttonStop1.onclick = ->
    sound.play()
    clearInterval Interval1
    return

  buttonReset.onclick = ->
    clearInterval Interval1
    tens = '00'
    seconds = '00'
    minutes = '0'
    appendTens1.innerHTML = tens
    appendSeconds1.innerHTML = seconds
    appendMinutes1.innerHTML = minutes

    return
  return

