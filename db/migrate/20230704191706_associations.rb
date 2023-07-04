# frozen_string_literal: true

class Associations < ActiveRecord::Migration[7.0]
  def change
    add_column :quiz_questions, :pokemon_ids, :integer, array: true, default: []
  end
end
