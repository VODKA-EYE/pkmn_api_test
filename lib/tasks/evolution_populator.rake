require 'csv'

namespace :pokemons do
  desc 'Encrypts SCM and LDAP passwords in the database.'
  task populate_evolutions: :environment do
    array = [[], [], []]
    CSV.foreach('evolutions.csv', headers: true).each do |row|
      array[0] << row[0] if row[0]
      array[1] << row[1] if row[1]
      array[2] << row[2] if row[2]
    end
    array.each_with_index do |e, i|
      e.each do |name|
        pokemons = Pokemon.where(og_name: name)
        Pokemon.transaction { pokemons.each { |pok| pok.update(evolution_stage: i + 1) } } if pokemons
      end
    end
  end
end
