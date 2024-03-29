# frozen_string_literal: true

class QuizService
  def initialize(questions)
    @questions = QuizQuestion.where(id: questions)
  end

  def result
    pokemon = your_pokemon
    save_pokemon pokemon.id
    pokemon
  end

  def your_pokemon
    return Pokemon.find_by_name('Beedrill') if @questions.empty?
    return Pokemon.find_by_name('Bulbasaur') if QuizQuestion.count == @questions.size

    array = []
    @questions.each do |row|
      array.concat row.pokemon_ids
    end
    
    id = array.tally.sort_by { |_k, v| v }[-1].first
    Pokemon.find id
  end

  def save_pokemon(id)
    Current.user.update(my_pokemon_id: id)
  end
end
