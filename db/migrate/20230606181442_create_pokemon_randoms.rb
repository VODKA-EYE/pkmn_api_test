# frozen_string_literal: true

class CreatePokemonRandoms < ActiveRecord::Migration[7.0]
  def change
    create_table :pokemon_randoms do |t|
      t.references :pokemon
      t.timestamps
    end
  end
end
