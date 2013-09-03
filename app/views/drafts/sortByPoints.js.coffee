console.log "On server!"
$('#playersAvail').html("<%= j render :partial => 'shared/playersAvailable' %>")