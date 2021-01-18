class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.string :rating
      t.string :runtime
      t.string :genre
      t.string :summary
      t.binary :poster
      t.timestamps
    end
  end
end
