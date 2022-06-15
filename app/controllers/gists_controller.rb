class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find params[:test_passage_id]
    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.success?
      create_gist

      flash[:info] = "#{t('.success')} #{view_context.link_to_created_gist(@result.url)}"
    else
      flash[:danger] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def create_gist
    current_user.gists.build(question: @test_passage.current_question, url: @result.url).save
  end
end
