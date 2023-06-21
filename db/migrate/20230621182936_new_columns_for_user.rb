# frozen_string_literal: true

class NewColumnsForUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :email, false
    add_column :users, :login, :string
    add_column :users, :last_entry, :datetime
    add_reference :users, :my_pokemon, foreign_key: { to_table: :pokemons }
  end
end
