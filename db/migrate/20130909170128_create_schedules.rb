class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.integer :week
      t.datetime :date
      t.integer :visitor_id
      t.integer :home_id
      t.integer :visitor_score
      t.integer :home_score
      t.integer :winning_team_id

      t.timestamps
    end
  end
end
