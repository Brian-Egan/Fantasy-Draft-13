class Draft < ActiveRecord::Base

	belongs_to :team
	belongs_to :player

	def self.round(round)
        if round
          where('round LIKE ?', "%#{round}%")
        else
          scoped
        end
  end

end
