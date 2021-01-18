class AddAverageToRankings < ActiveRecord::Migration[6.1]
  def change
    add_column :rankings, :average, :integer
  end
end
