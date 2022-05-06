class GistsController < ApplicationController
  def create
    @test_passage = TestPassage.find params[:test_passage_id]

    @result = GistQuestionService.new(@test_passage.current_question).call

    if @result.html_url
      create_gist
      flash[:info] = "#{t('.success')} #{view_context.link_to t('.link_to_gist'), @result.html_url, class: "alert-link"}"
    else
      flash[:danger] = t('.failure')
    end

    redirect_to @test_passage
  end

  private

  def create_gist
    current_user.gists.build(question: @test_passage.current_question, url: @result.html_url).save
  end
end
