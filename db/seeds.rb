# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


DATA = {
    :user_keys =>
      ["username", "email", "password_digest", "best_worst_movie", "avatar", "admin"],
    :users => [
      ["NattyWoohoo", "nattywoohoo@gmail.com", "password", "Troll 2", "", "true" ],
      ["DaffyDaphne", "daffy@daphne.com", "password", "A Talking Cat!?!", "", "true"],
      ["TonyMontana", "tony@montana.com", "password", "Uninvited", "", "true"]
    ],
  }
  
  def make_users
    DATA[:users].each do |user|
      new_user = User.new
      user.each_with_index do |attribute, i|
        new_user.send(DATA[:user_keys][i]+"=", attribute)
      end
      new_user.save
    end
  end
  
    
  make_users
  