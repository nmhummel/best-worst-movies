class ChangeAverageIntegerToDecimal < ActiveRecord::Migration[6.1]
  def change
    change_column :rankings, :average, :float
  end
end
