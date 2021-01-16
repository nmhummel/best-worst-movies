class CreateRankings < ActiveRecord::Migration[6.1]
  def change
    create_table :rankings do |t|
      t.integer :editing
      t.integer :cinematography
      t.integer :acting
      t.integer :special_effects
      t.integer :sound
      t.integer :plot
      t.integer :effort
      t.boolean :watch_again, default: false
      t.text :comments
      t.integer :movie_id

      t.timestamps
    end
  end
end
