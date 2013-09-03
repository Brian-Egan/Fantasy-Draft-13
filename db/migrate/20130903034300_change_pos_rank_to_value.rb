class ChangePosRankToValue < ActiveRecord::Migration
  def change
  	rename_column :players, :pos_rank, :value
  end
end
