class Team < ActiveRecord::Base

	has_many :players, :through => :draft
	
end
