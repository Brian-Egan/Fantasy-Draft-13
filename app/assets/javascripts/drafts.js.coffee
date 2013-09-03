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




$(document).delegate ".playerRow:not(:last-child)", "click", ->
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
	roundNumber = $('#roundNum').text();
	$('.posBtn').removeClass('active')
	$(this).addClass('active')
	subMit = {utf: "✓", position: playerPos, round: roundNumber}
	$.get('/sortPOS', subMit, null, 'script')

$(document).delegate ".ownerName", "click", ->
	teamNum = $(this).data('tid');
	mBody = $('#aModalBody')
	$('#aTeamName').empty()
	mBody.empty()
	console.log "About to get server response"
	subMit = {utf: "✓", teamID: teamNum}
	$.get('/team/modal', subMit, null, 'script')

$(document).ready ->
	$('.wklyPoints').hide()

$(document).delegate ".pointsBtn", "click", ->
	$('.pointsBtn').removeClass('active')
	$(this).addClass('active')
	typeShow = $(this).data('pos')
	if typeShow == "weekly"
	 	$('.wklyPoints').show()
	 	$('.seasonPoints').hide()
	if typeShow == "season"
	 	$('.wklyPoints').hide()
	 	$('.seasonPoints').show()
	# alert typeShow
	console.log typeShow

$(document).delegate "#sortPoints", "click", ->
	if $(this).hasClass("active")
		$(this).removeClass('active')
		subMit = {utf: "✓", order: "overall"}
	else
		$(this).addClass('active')
		subMit = {utf: "✓", order: "points"}
	console.log "Points!"
	$.get('/playerssort', subMit, null, 'script')
