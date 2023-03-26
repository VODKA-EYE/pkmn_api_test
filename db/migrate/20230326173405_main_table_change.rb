# frozen_string_literal: true

class MainTableChange < ActiveRecord::Migration[7.0]
  def change
    remove_column :pokemons, :ability1
    remove_column :pokemons, :ability2
    remove_column :pokemons, :ability_hidden
    remove_column :pokemons, :color
    remove_column :pokemons, :egg_group1
    remove_column :pokemons, :egg_group2
    remove_column :pokemons, :type1
    remove_column :pokemons, :type2
    remove_column :pokemons, :category

    add_reference :pokemons, :ability1, foreign_key: { to_table: :abilities }
    add_reference :pokemons, :ability2, foreign_key: { to_table: :abilities }
    add_reference :pokemons, :ability_hidden, foreign_key: { to_table: :abilities }
    add_reference :pokemons, :color, foreign_key: { to_table: :colors }
    add_reference :pokemons, :egg_group1, foreign_key: { to_table: :egg_types }
    add_reference :pokemons, :egg_group2, foreign_key: { to_table: :egg_types }
    add_reference :pokemons, :type1, foreign_key: { to_table: :pokemon_types }
    add_reference :pokemons, :type2, foreign_key: { to_table: :pokemon_types }
    add_reference :pokemons, :category, foreign_key: { to_table: :categories }
  end
end
