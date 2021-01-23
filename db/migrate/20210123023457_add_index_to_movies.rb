class AddIndexToMovies < ActiveRecord::Migration[6.1]
  def change
    add_index :movies, :title
  end
end
