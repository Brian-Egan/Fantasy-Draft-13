class Team < ActiveRecord::Base

	has_many :players, :through => :drafts
	has_many :drafts

	def self.playerz
		self.drafts.each do |d|
			return d.player_id
		end
	end
end
