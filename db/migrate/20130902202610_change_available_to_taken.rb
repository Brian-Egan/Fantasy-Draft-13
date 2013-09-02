class ChangeAvailableToTaken < ActiveRecord::Migration
  def change
  	rename_column :players, :available, :taken
  end
end
