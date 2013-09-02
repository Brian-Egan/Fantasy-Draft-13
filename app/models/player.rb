class Player < ActiveRecord::Base

	has_one :draft
	has_one :team, :through => :draft

	def self.avail
		where(:taken => false)
	end

	def self.gone
		where(:taken => true)
	end


	def self.titles
    	return Player.where(taken: true).all
   	end
end

