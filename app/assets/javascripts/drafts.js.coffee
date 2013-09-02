# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).delegate "#draftSubmit", "click", ->
  playerName = $("#pName").val();
  playerPos = $("#pPos").val();
  roundNumber = $('#roundNum').text();
  pickNumber = $('#pickNum').text();
  teamNum = $('#teamPicking').data('tid');

  # alert "Player: " + playerName + ", Position: " + playerPos

  # mData = {name: playerName, position: playerPos, round: roundNumber, pick: pickNumber, teamID: teamNum}
  subMit = {utf: "✓", name: playerName, position: playerPos, round: roundNumber, pick: pickNumber, teamID: teamNum}
  $.post('/drafts', subMit, null, "script")




$(document).delegate ".playerRow", "click", ->
	playerName = $(this).data('name');
	$('#draftHeader').fadeOut('fast')
	roundNumber = $('#roundNum').text();
	pickNumber = $('#pickNum').text();
	teamNum = $('#teamPicking').data('tid');
	$(this).fadeOut('fast');
	subMit = {utf: "✓", name: playerName, round: roundNumber, pick: pickNumber, teamID: teamNum}
	$.post('/drafts', subMit, null, "script")

$(document).delegate ".posBtn", "click", ->
	playerPos = $(this).data('pos');
	subMit = {utf: "✓", position: playerPos}
	$.get('/sortPOS', subMit, null, 'script')
