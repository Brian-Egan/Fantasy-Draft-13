class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :rank1
      t.integer :rank2
      t.integer :rank3
      t.integer :pos_rank
      t.boolean :available
      t.integer :draft_id
      t.integer :team_id

      t.timestamps
    end
  end
end
