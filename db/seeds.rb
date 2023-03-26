# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

csv_hash = {}
csv_hash['abilities'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Abilities.csv'))
csv_hash['categories'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Category.csv'))
csv_hash['colors'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Color.csv'))
csv_hash['egg_types'] = CSV.parse File.read(Rails.root.join('CSV_files', 'EggType.csv'))
csv_hash['pokemon_types'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Types.csv'))

csv_hash.each do |k, v|
  klass = k.classify.constantize
  v.each do |row|
    klass.create(id: row[0], name: row[1])
  end
end

items = []
CSV.foreach(Rails.root.join('CSV_files', 'Pokemons3nf.csv'), headers: true) do |row|
  items << row.to_h
end

Pokemon.import(items)

Rake::Task['pokemons:populate_evolutions'].invoke
