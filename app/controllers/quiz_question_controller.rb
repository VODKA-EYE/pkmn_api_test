# frozen_string_literal: true

class QuizQuestionController < BaseController
  def get_question
    render json: QuizQuestion.find(params[:id])
  end

  def result
    render json: QuizService.new(params['questions']).result
  end
end
