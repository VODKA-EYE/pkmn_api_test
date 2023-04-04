# frozen_string_literal: true

class CreateAdditionalTables < ActiveRecord::Migration[7.0]
  def change
    remove_reference :pokemons, :ability1
    remove_reference :pokemons, :ability2
    remove_reference :pokemons, :ability_hidden
    remove_reference :pokemons, :color
    remove_reference :pokemons, :egg_group1
    remove_reference :pokemons, :egg_group2
    remove_reference :pokemons, :type1
    remove_reference :pokemons, :type2
    remove_reference :pokemons, :category
    remove_column :pokemons, :generation
    remove_column :pokemons, :gender_male
    remove_column :pokemons, :gender_female
    remove_column :pokemons, :gender_unknown
    remove_column :pokemons, :egg_steps
    remove_column :pokemons, :get_rate
    remove_column :pokemons, :base_experience
    remove_column :pokemons, :hp
    remove_column :pokemons, :attack
    remove_column :pokemons, :defence
    remove_column :pokemons, :sp_attack
    remove_column :pokemons, :sp_defence
    remove_column :pokemons, :speed
    remove_column :pokemons, :total
    remove_column :pokemons, :weight
    remove_column :pokemons, :height
    remove_column :pokemons, :experience_type
    remove_column :pokemons, :evolution_stage

    drop_table :egg_types

    create_table :stats do |t|
      t.integer :hp
      t.integer :attack
      t.integer :defence
      t.integer :sp_attack
      t.integer :sp_defence
      t.integer :speed
      t.integer :total
      t.references :pokemon
      t.timestamps
    end

    create_table :characteristics do |t|
      t.integer :generation
      t.float :height
      t.float :weight
      t.float :gender_male
      t.float :gender_female
      t.integer :evolution_stage
      t.references :category, foreign_key: { to_table: :categories }
      t.references :ability_hidden, foreign_key: { to_table: :abilities }
      t.references :color, foreign_key: { to_table: :colors }
      t.references :pokemon_types, foreign_key: { to_table: :pokemon_types }
      t.references :pokemon
      t.timestamps
    end

    add_reference :pokemons, :stats
    add_reference :pokemons, :characteristics

    create_join_table :characteristics, :abilities

    create_join_table :characteristics, :pokemon_types
  end
end
