# frozen_string_literal: true

class AddExtraTables < ActiveRecord::Migration[7.0]
  def change
    create_table :abilities do |t|
      t.string :name
      t.timestamps
    end

    create_table :categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :colors do |t|
      t.string :name
      t.timestamps
    end

    create_table :egg_types do |t|
      t.string :name
      t.timestamps
    end

    create_table :pokemon_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
