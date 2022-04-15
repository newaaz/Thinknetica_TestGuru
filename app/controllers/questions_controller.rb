class QuestionsController < ApplicationController
  before_action :set_test, only: %i[index create destroy]
  before_action :set_question, only: %i[show destroy]

  def index
    render plain: @test.questions.pluck(:body).join("\n")
  end

  def show
    render plain: @question.body
  end

  def new
  end

  def create
    @question = @test.questions.build(question_params)
    if question.save
      redirect_to test_questions_path @test
    else
      render plain: "Question create failed"
    end
  end

  def destroy
    @question.destroy
    redirect_to test_questions_path @test
  end

  private

  def set_test
    @test = Test.find(params[:test_id])
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:body)
  end
end
