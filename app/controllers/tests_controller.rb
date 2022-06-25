class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)

    test_passage = current_user.test_passage(@test)
    test_passage.update_columns(passage_time: (@test.time_limit * 60))
    redirect_to test_passage
  end
end
