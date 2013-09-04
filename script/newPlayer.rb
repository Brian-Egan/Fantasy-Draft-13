def newPlayer(name, pos)
	p = Player.new(:name => name, :position => pos)
	p.save
	d = Draft.new(:player_id => p.id)
	d.save
end