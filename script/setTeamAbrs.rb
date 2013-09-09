numTeams = Club.maximum('id')
i = 1
while i < numTeams + 1
	
	if Club.exists?(i)
		tm = Club.find(i)
		if tm.city_abr.include? " "
			puts "Yes"
			tm.city_abr = tm.city_abr.chop
		end

		tm.save
		
	end


	i += 1
end
