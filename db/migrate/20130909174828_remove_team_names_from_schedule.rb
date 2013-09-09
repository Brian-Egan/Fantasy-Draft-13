class RemoveTeamNamesFromSchedule < ActiveRecord::Migration
  def change
  	remove_column :schedules, :visitor_name
	remove_column :schedules, :home_name
  end
end
