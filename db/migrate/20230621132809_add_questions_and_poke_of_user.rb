# frozen_string_literal: true

class AddQuestionsAndPokeOfUser < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_questions do |t|
      t.string :name
    end
  end
end
