class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :city_abr
      t.string :city
      t.string :name
      t.integer :wins
      t.integer :losses
      t.integer :ties
      t.decimal :win_percentage

      t.timestamps
    end
  end
end
