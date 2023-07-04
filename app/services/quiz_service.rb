# frozen_string_literal: true

class QuizService
  def initialize(questions)
    @questions = QuizQuestion.where(id: questions)
  end

  def result
    return Pokemon.find_by_name('Beedrill') if @questions.empty?

    array = []
    @questions.each do |row|
      array.concat row.pokemon_ids
    end
    id = array.tally.max_by { |_k, v| v }[0]
    save_pokemon id
    Pokemon.find id
  end

  def save_pokemon(id)
    Current.user.update(my_pokemon_id: id)
  end
end
