# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true
      t.timestamps
    end
  end
end
