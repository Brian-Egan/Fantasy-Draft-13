class Player < ActiveRecord::Base

	has_one :draft
	has_one :team, :through => :draft

end
