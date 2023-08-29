# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'csv'

# takes .csv files of separated tables and adds to csv_hash
csv_hash = {}
csv_hash['abilities'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Abilities.csv'))
csv_hash['categories'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Category.csv'))
csv_hash['colors'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Color.csv'))
csv_hash['pokemon_types'] = CSV.parse File.read(Rails.root.join('CSV_files', 'Types.csv'))
csv_hash['quiz_questions'] = CSV.parse File.read(Rails.root.join('CSV_files', 'questions.csv'))

# iterations to add info from hash into database
csv_hash.each do |k, v|
  klass = k.classify.constantize
  v.each do |row|
    klass.create(id: row[0], name: row[1])
  end
end

# adds info from .csv file
items = []
CSV.foreach(Rails.root.join('CSV_files/New', 'CharacteristicsTest.csv'), headers: true) do |row|
  items << row.to_h
end

Characteristic.import(items)
items = []

CSV.foreach(Rails.root.join('CSV_files/New', 'StatsTest.csv'), headers: true) do |row|
  items << row.to_h
end
Stat.import(items)
items = []

CSV.foreach(Rails.root.join('CSV_files/New', 'Pokemons3nf2.csv'), headers: true) do |row|
  items << row.to_h
end

Pokemon.import(items)

Rake::Task['pokemons:populate_evolutions'].invoke

question_hash = {
  "1": Pokemon.where(name: %w[Meowth Jigglypuff Nidoqueen Charmander Vaporeon]).pluck(:id),
  "2": Pokemon.where(name: %w[Meowth Charmander Vulpix]).pluck(:id),
  "3": Pokemon.where(name: %w[Meowth Jigglypuff Pikachu Charmander Vaporeon]).pluck(:id),
  "4": Pokemon.where(name: %w[Squirtle Pidgey Charmander Vulpix]).pluck(:id),
  "5": Pokemon.where(name: %w[Squirtle Pidgey Nidoqueen Pikachu Charmander Vaporeon]).pluck(:id),
  "6": Pokemon.where(name: %w[Jigglypuff Charmander Vulpix]).pluck(:id),
  "7": Pokemon.where(name: %w[Meowth Jigglypuff Charmander Vaporeon]).pluck(:id),
  "8": Pokemon.where(name: %w[Jigglypuff Nidoqueen Charmander Vulpix]).pluck(:id),
  "9": Pokemon.where(name: %w[Jigglypuff Charmander Vaporeon]).pluck(:id),
  "10": Pokemon.where(name: %w[Meowth Squirtle Eevee Charmander Vulpix]).pluck(:id)
}

QuizQuestion.all.each do |row|
  row.update(pokemon_ids: question_hash[:"#{row.id}"])
end

sql = <<~EOS
  COPY abilities_characteristics(characteristic_id, ability_id)
  FROM '#{Rails.root.join('CSV_files/New', 'abilities_stats.csv')}'
  DELIMITER ',';
  COPY characteristics_pokemon_types(characteristic_id, pokemon_type_id)
  FROM '#{Rails.root.join('CSV_files/New', 'TypeOfPokemonToCharacteristics.csv')}'
  DELIMITER ',';
EOS

ActiveRecord::Base.connection.execute(sql)

# for heroku
# \COPY abilities_characteristics(characteristic_id, ability_id)
# FROM 'CSV_files/New/abilities_stats.csv'
# DELIMITER ',';
# \COPY characteristics_pokemon_types(characteristic_id, pokemon_type_id)
# FROM 'CSV_files/New/TypeOfPokemonToCharacteristics.csv'
# DELIMITER ',';
