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


def make_movies
    excel_file = CSV.read('public/schlock-films.csv', headers: true, encoding:'iso-8859-1:utf-8')
    @movies = {}
    excel_file.each do |m|
        @movies = Movie.create(title: m[0], year: m[1], rating: m[2], runtime: m[3], genre: m[4])
    end
end
# # iterator-style:
# CSV.foreach("path/to/file.csv", **options) do |row|
  # ...

# m[0] 1st things
# m1 = years
# m is array of cells in row

# mvie.create - year: m[1], etc...


make_movies

# def make_movies
#   excel_file = Roo::Spreadsheet.open('public/schlock-flop-movies.xlsx')
#   @only_sheet = excel_file.sheet(0)
#   @new_movie = {}
 
#   @only_sheet.each(title: 'title', year: 'year', rating: 'rating', runtime: 'runtime', genre: 'genre') do |movie_hash|
#     @new_movie = movie_hash
#   end
# end

# def make_movies
#   excel_file = Roo::Spreadsheet.open('public/schlock-flop-movies.xlsx')
#   @only_sheet = excel_file.sheet(0)
#   @new_movie = Movie.new
#   @only_sheet.each(title: 'title', year: 'year', rating: 'rating', runtime: 'runtime', genre: 'genre') do |movie_hash|
#     movie_hash.each_with_index do |attribute, i|
#       @new_movie.send(@only_sheet[:movie_keys][i]+'=', attribute)
#     end
#       @new_movie.save
#   end
# end

#Show.create!(name: name, description: description)



