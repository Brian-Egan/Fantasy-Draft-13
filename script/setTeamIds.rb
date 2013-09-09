numGames = Schedule.maximum('id')
i = 1
while i < numGames + 1
	
	if Schedule.exists?(i)
		gm = Schedule.find(i)
		vis_name = gm.visitor_name
		if vis_name.include? " "
			vTeamName = vis_name.chop
		else
			vTeamName = vis_name
		end
		home_name = gm.home_name
		home_name.slice!(0)
		if home_name.include? " "
			hTeamName = home_name.chop
		else
			hTeamName = home_name
		end

		vTeamID = Club.where(:city_abr => vTeamName).take.id
		hTeamID = Club.where(:city_abr => hTeamName).take.id

		gm.visitor_id = vTeamID
		gm.home_id = hTeamID

		gm.save
		
	end


	i += 1
end