# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


File.read('db/seeds.json').lines[0..0].each do |l|
  h = JSON.parse l.chomp

  Recipe.create h
    .merge(searchable_ingredients: h['ingredients'].to_json)
    .except('tags', 'image', 'nb_comments', 'author_tip', 'ingredients')
end
