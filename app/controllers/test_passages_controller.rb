class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    if params[:answer_ids].present?
      @test_passage.accept!(params[:answer_ids])
      if @test_passage.comleted?
        redirect_to result_test_passage_path(@test_passage)
      else
        render :show
      end
    else
      redirect_to @test_passage, notice: "Select one or more answers"
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end
end
