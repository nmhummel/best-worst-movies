class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.text :username
      t.text :email
      t.text :password_digest
      t.text :best_worst_movie
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
