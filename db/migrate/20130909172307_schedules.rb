class Schedules < ActiveRecord::Migration
  def change
  	add_column :schedules, :visitor_name, :string
  	add_column :schedules, :home_name, :string
  end
end
