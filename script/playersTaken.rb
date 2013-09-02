numBooks = Player.count
i = 1
while i < numBooks + 1
	if Player.exists?(i)
		bk = Player.find(i)
		bk.taken = false
		bk.save
	end
	
	i += 1
end