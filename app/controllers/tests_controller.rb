class TestsController < ApplicationController

  before_action :find_test, only: %i[show]

  def index    
    render plain: Test.all.pluck(:title).join("\n")
  end

  def show    
    render inline: '<%= @test.title %>'
  end

  def new
  end

  def create
    test = Test.create(test_params.merge({ author: User.first }))
    render plain: test.inspect
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end

  def find_test
    @test = Test.find(params[:id])
  end

end
