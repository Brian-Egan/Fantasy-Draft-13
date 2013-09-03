class AddPosRankAndWklyPointsToPlayers < ActiveRecord::Migration
  def change
  	add_column :players, :pos_rank, :integer
  	add_column :players, :wkly_points, :decimal
  end
end
