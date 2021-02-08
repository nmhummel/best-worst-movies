class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.text :title
      t.text :year
      t.text :rating
      t.text :runtime
      t.text :genre
      t.timestamps
    end
  end
end
