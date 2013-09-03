class ChangeRank2ToDecimal < ActiveRecord::Migration
  def change
  	change_column :players, :rank2, :decimal
  end
end
