# frozen_string_literal: true

class CreatePokemon < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemons do |t|
      t.string :pokedex
      t.string :og_name
      t.string :name
      t.string :generation
      t.string :height
      t.string :weight
      t.string :type1
      t.string :type2
      t.string :ability1
      t.string :ability2
      t.string :ability_hidden
      t.string :color
      t.string :gender_male
      t.string :gender_female
      t.string :gender_unknown
      t.string :egg_steps
      t.string :egg_group1
      t.string :egg_group2
      t.string :get_rate
      t.string :base_experience
      t.string :experience_type
      t.string :category
      t.string :hp
      t.string :attack
      t.string :defence
      t.string :sp_attack
      t.string :sp_defence
      t.string :speed
      t.string :total
      t.string :picture_url
      t.timestamps
    end
  end
end
