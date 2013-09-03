# alert "Now in the server response!"
$('#aTeamName').html("<%= @name %>")
mBody = $('#aModalBody')
posAvail = {QB: 2, RB: 1, WR: 2, TE: 1, PK: 1, Def: 1, Flex: 1, Bench: 7, Total: 15}
console.log "<%= j @posAvail %>"
$('#anyTeam').html("<%= j render :partial => 'shared/anyTeamModal', :locals => {:teamName => @name  %>")
$('#anyTeam').modal('toggle')
